//
//  CustomTabBarVc.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import Foundation
import UIKit

class CustomTabABarvc: UITabBarController, UITabBarControllerDelegate {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = nil
        self.delegate = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.frame.size.height = 92
        tabBar.frame.origin.y = view.frame.height - 92
        tabBar.tintColor = UIColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 1)
        tabBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = false
        self.tabBar.layer.cornerRadius = 20
//        self.tabBar.layer.shadowColor = CGColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 1)
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.view.isOpaque = false
        
        
    }
    
}
