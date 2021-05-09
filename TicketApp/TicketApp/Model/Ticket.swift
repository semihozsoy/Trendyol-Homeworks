//
//  Ticket.swift
//  TicketApp
//
//  Created by Semih Özsoy on 5.05.2021.
//

import UIKit

class Ticket {
    
    var passenger : Passenger?
    var calendar : Mycalendar?
    var time : Time?
    var city: City?
    var seat: [Int] = []
    var seatNumber: Int?
   
    let controller = UIViewController()
    init(){}
    
    func compare(ticket:Ticket)->Bool{
        for seat in seat{
            for seat2 in ticket.seat{
                if seat == seat2 {
                    return true
                } else if  seat >= seat2 {
                    makeAlert()
                   return false
                    
                } else {
                    return false
                }
            }
        }
        return false
    }
    
    func bookSeat(seatNumber:Int)->Bool{
         guard (1 ... 5).contains(seatNumber) else {
            if seatNumber == 0 {
                self.seatNumber = seatNumber
            }
            return false
        }
        seat.append(seatNumber)
        return true
    }
    
    func addSeatNo(number:Int){
        guard (1 ... 45).contains(number) else { return }
        seat.append(number)
    }
    
    func makeAlert(){
        let alert = UIAlertController(title: "Error", message: "Your seat numbers are not same", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        controller.present(alert, animated: true, completion: nil)
    }

}



