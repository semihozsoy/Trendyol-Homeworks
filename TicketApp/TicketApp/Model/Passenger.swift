//
//  Passenger.swift
//  TicketApp
//
//  Created by Semih Özsoy on 5.05.2021.
//

import UIKit

class Passenger {
    var passengerName: String = ""
    var passengerSurname: String = ""
    let id: Int = 0

    
    func printPassenger(){
        print("Ad \(self.passengerName)"+"Soyad \(self.passengerSurname)"+"ID \(self.id)")
       
    }
}
