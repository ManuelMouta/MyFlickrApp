//
//  NotificationManager.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 04/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct NotificationManager {
    
    static func sendUpdateTableNotification(){
        let notificationIdName = Notification.Name("NotifyDataLoaded")
        let nc = NotificationCenter.default
        nc.post(name:notificationIdName,
                object: nil,
                userInfo:["message":"success"])
        
    }
    
}
