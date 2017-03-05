//
//  FlickrServiceParsers.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 04/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct FlickrServiceParsers {
    
    static func parseServicePhotosByUser(json : [String: Any]){
        
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
            NotificationManager.sendUpdateTableNotification()
            //print(UserPhotoObject.ListOfPhotos)
        }catch{
            print("error parsing json")
        }
    }
}
