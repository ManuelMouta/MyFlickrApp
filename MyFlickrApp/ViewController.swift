//
//  ViewController.swift
//  MyFlickrApp
//
//  Created by Manuel Mouta on 03/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //MARK: Local Variables
    
    //MARK: UIBOutlet
    @IBOutlet weak var tableViewResults: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return UserPhotoObject.ListOfPhotos!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = String(describing: UserPhotoObject.ListOfPhotos?[indexPath.row].id)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationIdName = Notification.Name("NotifyDataLoaded")
        // Register to receive notification
        let notificationDataIsLoaded = NotificationCenter.default
        notificationDataIsLoaded.addObserver(forName:notificationIdName,
                       object:nil, queue:nil,
                       using:catchNotification)

        ServiceGetPhotosByUser.getPhotosByUserId()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func catchNotification(notification:Notification) -> Void {
        guard let userInfo = notification.userInfo,
            let message  = userInfo["message"] as? String
        else {
            print("Failed to load Data!")
            return
        }
        if message == "success"{
            self.tableViewResults.reloadData()
        }
    }
}

