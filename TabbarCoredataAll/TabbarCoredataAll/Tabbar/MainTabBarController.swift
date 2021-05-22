//
//  MainTabBarController.swift
//  TabbarCoredataAll
//
//  Created by Semih Özsoy on 15.05.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarButtonConfig()
        
    }
    
    public func tabbarButtonConfig(){
        
        let tabbarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        var tabbarFrame = tabbarButton.frame
        tabbarFrame.origin.y = view.bounds.height - tabbarFrame.size.height - 30
        tabbarFrame.origin.x = view.bounds.width/2 - tabbarFrame.size.width/2
        tabbarButton.frame = tabbarFrame
        tabbarButton.imageView?.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        tabbarButton.layer.cornerRadius = tabbarFrame.height/2
        tabbarButton.backgroundColor = .blue
      
        let image = UIImage(systemName: "plus.circle")
        tabbarButton.setImage(image, for: .normal)
        tabbarButton.contentMode = .scaleAspectFill
        tabbarButton.addTarget(self, action: #selector(actionButtonClicked), for: .touchUpInside)
        view.addSubview(tabbarButton)
        view.layoutIfNeeded()
        
    }
    
    @objc func actionButtonClicked(){
        self.selectedIndex = 1
    }
    
}
