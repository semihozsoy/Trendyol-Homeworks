//
//  Time.swift
//  TicketApp
//
//  Created by Semih Özsoy on 5.05.2021.
//

import UIKit

struct Time {
    let hour: Int
    let minutes: Int
    
    init(hour:Int,minutes:Int) {
        self.hour = hour
        self.minutes = hour
    }
    
    func printTime(){
        print(self.hour)
        print(self.minutes)
    }
}
