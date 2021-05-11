//
//  DenemeViewController.swift
//  TicketApp
//
//  Created by Semih Özsoy on 6.05.2021.
//

import UIKit

class SeatViewController: UIViewController {
    private let spacing:CGFloat = 16.0
    var seat : Int = 0
    var numberOfSeat : Int = 0
    var isSelectedSeat: Bool = false
    var myCalendar: Mycalendar?
    var time : Time?
    var passenger: Passenger?
    var ticket: Ticket?
    var city: City?
    var selectedSeatArray : [Int] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
   
        ticket = Ticket()
        ticket?.passenger = passenger
        ticket?.calendar = myCalendar
        ticket?.time = time
        ticket?.city = city
        ticket?.seatNumber = seat
    }
    
    @IBAction func getTicketClicked(_ sender: Any) {
        let ticketVC = storyboard?.instantiateViewController(identifier: "ticketVC") as! TicketViewController
        ticketVC.ticket = ticket
        present(ticketVC, animated: true)
    }
}

extension SeatViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 45
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCollectionViewCell
        cell.configure()
        cell.tintColor = .black
       // cell.changeBackgroundColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
                let numberOfItemsPerRow:CGFloat = 2
                let spacingBetweenCells:CGFloat = 30
                
                let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
                
                if let collection = self.collectionView{
                    let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                    return CGSize(width: width, height: width)
                }else{
                    return CGSize(width: 0, height: 0)
                }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if  ticket?.seatNumber ==  numberOfSeat{
            ticket?.seat = selectedSeatArray
           makeAlert(title: "Error", message: "You exceed the number of seat")
            print("ticket seat: \(ticket?.seat)")
       }
        
        else {
            selectedSeatArray.append(indexPath.item+1)
            numberOfSeat += 1
            collectionView.cellForItem(at: indexPath)?.tintColor = UIColor.blue
            print("selectedSeatArray: \(selectedSeatArray)")
        }
    }
    
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

