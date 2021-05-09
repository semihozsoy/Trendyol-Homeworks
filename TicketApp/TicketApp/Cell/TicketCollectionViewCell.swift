//
//  TicketCollectionViewCell.swift
//  TicketApp
//
//  Created by Semih Özsoy on 6.05.2021.
//

import UIKit

class TicketCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var calendarLabel: UILabel!
    @IBOutlet weak var passengerLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var qrCodeImage: UIImageView!
    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var whereToLabel: UILabel!
    
    var cornerRadius: CGFloat = 15.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(ticket:Ticket){
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        
        arrowImage.image = #imageLiteral(resourceName: "right-arrow")
        qrCodeImage.image = #imageLiteral(resourceName: "qrcode.png")
        calendarLabel.text = String("Date:\(ticket.calendar!.day)/\(ticket.calendar!.month)/\(ticket.calendar!.year)")
        passengerLabel.text = String("Passenger: \(ticket.passenger!.passengerName) \(ticket.passenger!.passengerSurname)")
        timeLabel.text = String("Time:\(ticket.time!.hour):\(ticket.time!.minutes)")
        fromLabel.text = ticket.city?.fromCity
        whereToLabel.text = ticket.city?.whereToCity
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(
        roundedRect: bounds, cornerRadius: cornerRadius
        ).cgPath
    }
    
}
