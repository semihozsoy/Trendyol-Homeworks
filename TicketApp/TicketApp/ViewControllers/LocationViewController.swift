//
//  LocationViewController.swift
//  TicketApp
//
//  Created by Semih Özsoy on 5.05.2021.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var chooseYourSeatsButton: UIButton!
    @IBOutlet weak var whereToTextField: UITextField!
    @IBOutlet weak var seatNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var datePicker: UIDatePicker!
    var passenger : Passenger?
    var city: City?
    var cornerRadius: CGFloat = 15.0
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var passengerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundRoad3.jpeg")!)
        configureComponents()
    
    }
 
    @IBAction func listAvailableBooksCLicked(_ sender: Any) {
        let seatVC = storyboard?.instantiateViewController(identifier: "seatVC") as! SeatViewController
        seatVC.seat = Int(stepper.value)
        
        let components = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: datePicker.date)
        let time = Time(hour: components.hour ?? 0, minutes: components.minute ?? 0)
        seatVC.time = time
        let calendar = Mycalendar(day: components.day ?? 0, month: components.month ?? 0, year: components.year ?? 0)
        
        var city = City()
        guard let fromText = fromTextField.text else { return }
        city.fromCity = fromText
        guard let whereToText = whereToTextField.text else { return }
        city.whereToCity = whereToText
        
        seatVC.city = city
        seatVC.myCalendar = calendar
        seatVC.passenger = passenger
       present(seatVC, animated: true, completion: nil)
 
    }
    
    @IBAction func seatStepperClicked(_ sender: UIStepper) {
        seatNumberLabel.text = "Seat Count: "+"\(Int(sender.value).description)"
        
    }
    
    func configureComponents(){
        whereToTextField.layer.cornerRadius = cornerRadius
        whereToTextField.layer.masksToBounds = true
        
        fromTextField.layer.cornerRadius = cornerRadius
        fromTextField.layer.masksToBounds = true
        
        chooseYourSeatsButton.layer.cornerRadius = cornerRadius
        chooseYourSeatsButton.layer.masksToBounds = true
        chooseYourSeatsButton.frame.size = CGSize(width: 230, height: 50)
        
        passengerView.layer.cornerRadius = cornerRadius
        passengerView.layer.masksToBounds = true
        passengerView.layer.borderWidth = 1
        passengerView.layer.borderColor = UIColor.black.cgColor
        
        dateView.layer.cornerRadius = cornerRadius
        dateView.layer.masksToBounds = true
        dateView.layer.borderWidth = 1
        dateView.layer.borderColor = UIColor.black.cgColor
    }
}


