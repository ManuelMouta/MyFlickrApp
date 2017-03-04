//
//  ErrorHandling.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 04/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct ErrorHandling {
    
    static func showDefaultException(methodException:String,classException:String){
        print("Exception thrown in method \(methodException) in class \(classException)")
    }
    
}
