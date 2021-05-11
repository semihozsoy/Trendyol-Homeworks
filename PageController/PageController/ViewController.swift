//
//  ViewController.swift
//  PageController
//
//  Created by Semih Özsoy on 4.05.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentPageLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = 4
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        pageControl.addTarget(self, action: #selector(pageChanger(_:)), for: .allTouchEvents)
    }

    @IBAction func pageChanger(_ sender: UIPageControl) {
        
        currentPageLabel.text = "Current page: \(sender.currentPage+1)"
        
        switch sender.currentPage {
        case 0:
            self.view.backgroundColor =  UIColor.blue
        case 1:
            self.view.backgroundColor = UIColor.red
        case 2:
            self.view.backgroundColor = UIColor.cyan
        case 3:
            self.view.backgroundColor = UIColor.orange
        default:
            self.view.backgroundColor = UIColor.systemGray
        }
    }
    
}

