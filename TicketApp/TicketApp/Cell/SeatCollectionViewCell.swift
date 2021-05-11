//
//  SeatCollectionViewCell.swift
//  TicketApp
//
//  Created by Semih Özsoy on 8.05.2021.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    var ticket : Ticket?
    @IBOutlet weak var seatImage: UIImageView!
    
    func configure(){
        seatImage.image = #imageLiteral(resourceName: "seat")
        
    }
        
}




