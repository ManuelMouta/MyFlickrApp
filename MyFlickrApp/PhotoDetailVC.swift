//
//  PhotoDetailVC.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 06/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit

protocol DetailPhotoSentDelegate{
    func setPhotoDetail(photo: PhotoObject)
}

class PhotoDetailVC: UIViewController {
    var photoId:String? = nil
    var photo: PhotoObject? = nil

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var photoDescription: UILabel!
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        
        //navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        photoImage.image = UIImage(data: (photo?.data)!)
        let sender : GetPhotoInfoServiceDelegate = self as GetPhotoInfoServiceDelegate
        FlickServices.getPhotoInfo(sender: sender,photoId: (photo?.id)!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PhotoDetailVC : GetPhotoInfoServiceDelegate {
    func refreshPhotoDetail(title:String,description:String){
        photoTitle.text = title
        photoDescription.text = description
    }
}
