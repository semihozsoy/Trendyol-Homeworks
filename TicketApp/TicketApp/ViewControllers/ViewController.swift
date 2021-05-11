//
//  ViewController.swift
//  TicketApp
//
//  Created by Semih Özsoy on 5.05.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var surnameLabel: UITextField!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    var cornerRadius: CGFloat = 15.0
    override func viewDidLoad() {
        super.viewDidLoad()
        configureComponents()
    }
    
    @IBAction func getStartedClicked(_ sender: Any) {
        let ticketVC = storyboard?.instantiateViewController(identifier: "locationVC") as! LocationViewController
        let passenger = Passenger()
        guard let nameText = nameLabel.text else { return }
        passenger.passengerName = nameText
        guard let surnameText = surnameLabel.text else { return }
        passenger.passengerSurname = surnameText
        ticketVC.passenger = passenger
        present(ticketVC, animated: true, completion: nil)
    }
    
    func configureComponents(){
        nameLabel.layer.cornerRadius = cornerRadius
        nameLabel.layer.masksToBounds = true
        nameLabel.frame.size = CGSize(width: 230, height: 50)
        
        surnameLabel.layer.cornerRadius = cornerRadius
        surnameLabel.layer.masksToBounds = true
        surnameLabel.frame.size = CGSize(width: 230, height: 50)
        
        getStartedButton.layer.cornerRadius = cornerRadius
        getStartedButton.layer.masksToBounds = true
        getStartedButton.layer.borderWidth = 2
        getStartedButton.frame.size = CGSize(width: 230, height: 50)
       
    }
    
}


