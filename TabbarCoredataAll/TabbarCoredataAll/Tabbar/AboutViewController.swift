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
    
    private func tabbarButtonConfig(){
        let tabbarItem = UITabBar(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        
        var tabbarFrame = tabbarItem.frame
        tabbarFrame.origin.x = view.bounds.width/2 - tabbarFrame.size.width/2
        tabbarFrame.origin.y = view.bounds.height - tabbarFrame.size.height
        
        
        tabbarItem.layer.cornerRadius = tabbarFrame.height/2
        view.addSubview(tabbarItem)

//        tabbarItem.layer.cornerRadius = tabbarItem.frame.size.width/2
//
//        tabbarItem.clipsToBounds = true

    }
    
    
}
