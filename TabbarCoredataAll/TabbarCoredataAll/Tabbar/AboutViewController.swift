//
//  AboutViewController.swift
//  TabbarCoredataAll
//
//  Created by Semih Özsoy on 13.05.2021.
//

import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarButtonConfig()
    }
    
     public func tabbarButtonConfig(){
        
        let tabbarItem = UITabBar(frame: CGRect(x: 0, y: 0, width: 128, height: 128))
        let tabbarButton = UIButton(frame: CGRect(x: 10, y: 10, width: 64, height: 64))
        
        var tabbarFrame = tabbarButton.frame
        tabbarFrame.origin.x = view.bounds.width/2 - tabbarFrame.size.width/2
        tabbarFrame.origin.y = view.bounds.height - tabbarFrame.size.height
        
        
       // tabbarItem.layer.cornerRadius = tabbarFrame.height/2
        //view.addSubview(tabbarItem)

//        tabbarButton.layer.cornerRadius = 30
//        tabbarButton.layer.maskedCorners = [.layerMaxXMinYCorner]
//        tabbarButton.layer.masksToBounds = true
//
        tabbarButton.backgroundColor = UIColor.red
        tabbarButton.layer.cornerRadius = tabbarFrame.height/2
        view.addSubview(tabbarButton)
        tabbarButton.setImage(UIImage(named: "button"), for: .normal)
        view.layoutIfNeeded()

    }
   
    
    
    
}
