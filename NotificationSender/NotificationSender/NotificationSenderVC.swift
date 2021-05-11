//
//  BViewController.swift
//  NotificationSender
//
//  Created by Semih Özsoy on 7.05.2021.
//

import UIKit

class NotificationSenderVC: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    
    var notificationData : [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func sendNotification(_ sender: UIButton) {
        let message = messageTextField.text
        notificationData["name"] = message
        NotificationCenter.default.post(name: .sendDataNotification, object: nil,userInfo: notificationData)
        dismiss(animated: true, completion: nil)
    }
    
}
