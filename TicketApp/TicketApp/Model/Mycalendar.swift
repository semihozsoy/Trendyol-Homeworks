//
//  Calendar.swift
//  TicketApp
//
//  Created by Semih Özsoy on 5.05.2021.
//

import UIKit

struct Mycalendar {
    let day: Int
    let month: Int
    let year: Int
    
    init(day:Int,month:Int,year: Int) {
        self.day = day
        self.month = month
        self.year = year
    
    }

    func printCalendar(){
        print(self.day)
        print(self.month)
        print(self.year)
        
    }
}
