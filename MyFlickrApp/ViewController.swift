//
//  ViewController.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 03/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate  {
    //MARK: Local Variables
    var photo: PhotoObject? = nil
    var photoIndex: Int = 0
    
    //MARK: UIBOutlet
    @IBOutlet weak var tableViewResults: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return PhotoObject.ListOfPhotosData!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
       // let destination = self.storyboard?.instantiateViewController(withIdentifier: String(describing: PhotoDetailVC())) as! PhotoDetailVC
       // navigationController?.pushViewController(destination, animated: true)
        
        let photoImage = UIImage(data: (PhotoObject.ListOfPhotosData?[indexPath.row].data)!)
        cell.imageView?.image = photoImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath : IndexPath) -> IndexPath? {
        photoIndex = indexPath.row
       // performSegue(withIdentifier: "segue", sender: self)
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let destination = self.storyboard?.instantiateViewController(withIdentifier: String(describing: PhotoDetailVC())) as! PhotoDetailVC

        destination.photo = PhotoObject.ListOfPhotosData?[photoIndex]

        navigationController?.pushViewController(destination, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sender : GetPhotoServiceDelegate = self
        FlickServices.getPublicPhotos(DispatchQoS.QoSClass.background,sender: sender) {(sucess, result) -> (Void) in
            if(sucess) {
                self.tableViewResults.reloadData()
            }
            else {
                // error
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "segue") {
            // initialize new view controller and cast it as your view controller
            let PhotoDetailVC = segue.destination as! PhotoDetailVC
            // your new view controller should have property that will store passed value
            PhotoDetailVC.photo = PhotoObject.ListOfPhotosData?[photoIndex]
        }
        
    }
    
    func getPhotosByUserId(success: Bool){
        if(success){
            self.tableViewResults.reloadData()
        }else{
            //error
        }
    }
}

extension ViewController : GetPhotoServiceDelegate {
    func refreshWithData(data:AnyObject){
        if(data as! String == "success"){
            self.tableViewResults.reloadData()
            /*tableViewResults.beginUpdates()
            tableViewResults.insertRows(at: [IndexPath(row: UserPhotoObject.ListOfPhotos!.count-1, section: 0)], with: .automatic)
            tableViewResults.endUpdates()*/
        }else{
            //error
        }
    }
}

/*extension String {
    func isURL() -> Bool {
        return self.hasPrefix("http")
    }
}*/

