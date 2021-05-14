//
//  CookTableViewCell.swift
//  TabbarCoredataAll
//
//  Created by Semih Özsoy on 14.05.2021.
//

import UIKit

class CookTableViewCell: UITableViewCell {
    @IBOutlet weak var cookImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    func config(data: Data?){
        cookImage.image = UIImage(data: data!)
    }
}
