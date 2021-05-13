//
//  CookCreateViewController.swift
//  TabbarCoredataAll
//
//  Created by Semih Özsoy on 13.05.2021.
//

import UIKit

class CookCreateViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cookNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
    }
    
    
    
    @IBAction func saveTapped(_ sender: Any) {
        
    }
    
}
