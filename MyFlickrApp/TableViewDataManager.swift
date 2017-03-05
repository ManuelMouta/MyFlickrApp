//
//  TableViewDataManager.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 04/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct TableViewDataManager {
    
    static func loadImagesDataFromUrl(){
        for case let photo in UserPhotoObject.ListOfPhotos!{
            let photoURL:String = "http://farm"+String(photo.farm)+".staticflickr.com/"+photo.server+"/"+photo.id+"_"+photo.secret+".jpg"
            let url = URL(string: photoURL)
            
            DispatchQueue.global().async {
                //make sure your image in this url does exist, otherwise unwrap in a if let check / try-
                let dataPhoto = try? Data(contentsOf: url!)
                if let photo = PhotoObject(id: photo.id,data: dataPhoto!) {
                    PhotoObject.ListOfPhotosData?.append(photo)
                }else{
                    print("Failed to create object")
                }
            }
        }
    }

}
