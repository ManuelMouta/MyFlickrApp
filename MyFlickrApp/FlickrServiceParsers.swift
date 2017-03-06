//
//  FlickrServiceParsers.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 04/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

protocol GetPhotoServiceDelegate{
    func refreshWithData(data:AnyObject)
    func refreshWithData2(data:AnyObject)
}


extension GetPhotoServiceDelegate{
    func refreshWithData2(data:AnyObject) {}
}

struct FlickrServiceParsers {
    //Local variables
    
    static func parseServicePhotosByUser(json : [String: Any], sender:GetPhotoServiceDelegate){
        
        do {
            //print(json)
            let jsonArrayPhotos = json["photos"] as! [String:Any]?
            let jsonPhoto = jsonArrayPhotos?["photo"] as? [[String: Any]]
            //print(jsonPhoto)
            for case let result in jsonPhoto!{
                if let photo = UserPhotoObject(json: result) {
                    UserPhotoObject.ListOfPhotos?.append(photo)
                }else{
                    print("Failed to create object")
                }
            }
            
            TableViewDataManager.loadImagesDataFromUrl()
            
            //print(UserPhotoObject.ListOfPhotos)
            DispatchQueue.main.async {
                sender.refreshWithData(data: "success" as AnyObject)
            }
            
        }catch{
            print("error parsing json")
        }
    }
}
