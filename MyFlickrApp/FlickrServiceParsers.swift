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

protocol GetPhotoInfoServiceDelegate {
    func refreshPhotoDetail(title:String,description:String)
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
            
            TableViewDataManager.loadImagesDataFromUrl(sender: sender)
            
            //print(UserPhotoObject.ListOfPhotos)
            
        }catch{
            print("error parsing json")
        }
    }
    
    static func parseServicePhotoDetail(json : [String: Any], sender:GetPhotoInfoServiceDelegate){
        
        do {
            print(json)
            let jsonArrayPhoto = json["photo"] as! [String:Any]?
            print(jsonArrayPhoto)
            let jsonTitle = jsonArrayPhoto?["title"] as! [String: Any]?
            print(jsonTitle)
            let title = jsonTitle!
            let titleValue = jsonTitle?["_content"] as? String
            let jsonDescription = jsonArrayPhoto?["description"] as! [String: Any]?
            let description = jsonDescription!
            let descriptionValue = jsonDescription?["_content"] as? String
            //print(jsonPhoto)

            DispatchQueue.main.async {
                sender.refreshPhotoDetail(title:titleValue!,description:descriptionValue!)
            }
            
        }catch{
            print("error parsing json")
        }
    }
}
