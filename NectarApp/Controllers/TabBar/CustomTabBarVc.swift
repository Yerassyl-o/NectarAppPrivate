//
//  CustomTabBarVc.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import Foundation
import UIKit

class CustomTabABarvc: UITabBarController, UITabBarControllerDelegate  {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    

    var customTabBarView = UIView(frame: .zero)
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setupTabBarUI()
            self.addCustomTabBarView()
            self.updateColorTabbarItems()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            self.setupCustomTabBarFrame()
            self.updateColorTabbarItems()
        }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
           
            tabBarController?.delegate = self
            tabBarController?.tabBar.delegate = self
        }
        
        private func setupCustomTabBarFrame() {
            let height = self.view.safeAreaInsets.bottom + 64
            
            var tabFrame = self.tabBar.frame
            tabFrame.size.height = height
            tabFrame.origin.y = self.view.frame.size.height - height
            
            self.tabBar.frame = tabFrame
            self.tabBar.setNeedsLayout()
            self.tabBar.layoutIfNeeded()
            customTabBarView.frame = tabBar.frame
        }
        
        private func setupTabBarUI() {
            self.tabBar.layer.cornerRadius = 15
            self.tabBar.layer.masksToBounds = true
            self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            self.tabBar.backgroundColor = UIColor.white
            self.tabBar.tintColor =  UIColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 1)
            
            // Remove the line
            if #available(iOS 13.0, *) {
                let appearance = self.tabBar.standardAppearance
                appearance.shadowImage = nil
                appearance.shadowColor = nil
                self.tabBar.standardAppearance = appearance
        
            } else {
                self.tabBar.shadowImage = UIImage()
                self.tabBar.backgroundImage = UIImage()
                
            }
        }
    
    func updateColorTabbarItems() {
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            self.tabBar.standardAppearance = appearance
            
            appearance.stackedLayoutAppearance.normal.iconColor = .black
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 1)
            
            
        } else {
           
            
            UITabBar.appearance().tintColor = UIColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 1)
            UITabBar.appearance().unselectedItemTintColor = .black
        }

    }
        
        private func addCustomTabBarView() {
            self.customTabBarView.frame = tabBar.frame
            
            self.customTabBarView.backgroundColor = UIColor.white
            self.customTabBarView.layer.cornerRadius = 15
            self.customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

            self.customTabBarView.layer.masksToBounds = false
            self.customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.15).cgColor
            self.customTabBarView.layer.shadowOffset = .zero
            self.customTabBarView.layer.shadowOpacity = 1
            self.customTabBarView.layer.shadowRadius = 15
            self.view.addSubview(customTabBarView)
            self.view.bringSubviewToFront(self.tabBar)
        }
}
