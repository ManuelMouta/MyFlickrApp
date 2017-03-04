//
//  ServiceGetPhotosByUser.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 03/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct ServiceGetPhotosByUser {
    
    static func getPhotosByUserId(){
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key="+FlickrAPIConstants.apiKey+"&user_id="+FlickrAPIConstants.userId+"&format=json&nojsoncallback=1)!")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let data = data,
                        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        let jsonArrayPhotos = json?["photo"] as? [[String: Any]]
                        for case let result in jsonArrayPhotos! {
                            if let photo = UserPhotoObject(json: result) {
                                UserPhotoObject.ListOfPhotos?.append(photo)
                            }
                        }
                    }
                    
                    /*if let json = try JSONSerialization.jsonObject(with: data!) as? [String: Any],
                        let jsonArrayPhotos = json["photos"] as? [[String: Any]] {
                        print(jsonArrayPhotos)
                        for photo in jsonArrayPhotos {
                            if let photo = UserPhotoObject(json: photo) {
                                UserPhotoObject.ListOfPhotos?.append(photo)
                            }
                        }
                        sendNotification()
                    }*/
                } catch {
                    print("error in JSONSerialization")
                }
            }
            
        })
        task.resume()
    }
    
    static func sendNotification(){
        let notificationIdName = Notification.Name("NotifyDataLoaded")
        let nc = NotificationCenter.default
        nc.post(name:notificationIdName,
                object: nil,
                userInfo:["message":"success"])
        
    }
}
