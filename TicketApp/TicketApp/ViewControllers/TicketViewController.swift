//
//  TicketViewController.swift
//  TicketApp
//
//  Created by Semih Özsoy on 6.05.2021.
//

import UIKit

class TicketViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
   
    var ticket : Ticket?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TicketViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ticketCell", for: indexPath) as! TicketCollectionViewCell
        cell.configure(ticket: ticket!)
        return cell
    }
 
}


extension TicketCollectionViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.contentSize
        return CGSize(width: 200, height:200 )
    }
}
