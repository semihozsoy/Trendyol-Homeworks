//
//  ViewController.swift
//  TabbarCoredataAll
//
//  Created by Semih Özsoy on 13.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      tabBarConfig()
    }

    private func tabBarConfig(){
        guard let tabbar = tabBarController?.tabBar else {return}
        tabbar.barTintColor = .orange
        tabbar.tintColor = .white
        tabbar.unselectedItemTintColor = .black
        
        tabbar.layer.cornerRadius = 30
        tabbar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        tabbar.layer.masksToBounds = true
        
    
    }
  
   
}

