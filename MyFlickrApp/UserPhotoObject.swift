//
//  UserPhotosObject.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 03/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct UserPhotoObject {
    let farm : Int
    let id : Int
    let isFamily : Int
    let isFriend : Int
    let ispublic : Int
    let owner : String
    let secret : String
    let server : Int
    let title : String
    static var ListOfPhotos : [UserPhotoObject]? = [UserPhotoObject]()
    
    init?(json: [String: Any]) {
        //Should use guard when: if the condition is not met, guard‘s else statement is run
        guard let
            farm = json["farm"] as? Int,
            let id = json["id"] as? Int,
            let isFamily = json["isFamily"] as? Int,
            let isFriend = json["isFriend"] as? Int,
            let isPublic = json["isPublic"] as? Int,
            let owner = json["owner"] as? String,
            let secret = json["secret"] as? String,
            let server = json["server"] as? Int,
            let title = json["title"] as? String
        else {
            return nil
        }
        
        self.farm = farm
        self.id = id
        self.isFamily = isFamily
        self.isFriend = isFriend
        self.ispublic = isPublic
        self.owner = owner
        self.secret = secret
        self.server = server
        self.title = title
    }
}
