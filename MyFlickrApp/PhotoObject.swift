//
//  PhotoObject.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 03/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct PhotoObject {
    let id : String
    let data : Data
    static var ListOfPhotosData : [PhotoObject]? = [PhotoObject]()

    init?(id:String,data:Data) {
        self.id = id
        self.data = data
    }
}
