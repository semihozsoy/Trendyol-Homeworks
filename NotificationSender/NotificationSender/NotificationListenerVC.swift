//
//  ViewController.swift
//  NotificationSender
//
//  Created by Semih Özsoy on 7.05.2021.
//

import UIKit

class NotificationListenerVC: UIViewController {

    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var listenerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(handleData(notification:)) , name: .sendDataNotification, object: nil)
 
    }

    @objc func changeImage(){
        self.listenerImage.image = UIImage(systemName: "folder.fill")
    }
    
    
    @objc func handleData(notification:Notification){
        if let name = notification.userInfo?["name"] as? String{
            aLabel.text = name
        }
    }
}

