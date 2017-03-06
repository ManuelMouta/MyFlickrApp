//
//  ViewController.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 03/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //MARK: Local Variables
    
    //MARK: UIBOutlet
    @IBOutlet weak var tableViewResults: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return UserPhotoObject.ListOfPhotos!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = String(describing: UserPhotoObject.ListOfPhotos?[indexPath.row].id)
        return cell
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

