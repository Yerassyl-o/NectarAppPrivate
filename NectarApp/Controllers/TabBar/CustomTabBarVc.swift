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
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .white
////        UITabBar.appearance().shadowImage = UIImage()
////        UITabBar.appearance().backgroundImage = UIImage()
//        tabBar.layer.shadowColor = UIColor.black.cgColor
//        tabBar.layer.shadowOpacity = 0.3
//        tabBar.layer.shadowOffset = CGSize.zero
//        tabBar.layer.shadowRadius = 5
//        self.tabBar.layer.borderColor = UIColor.clear.cgColor
//        self.tabBar.layer.borderWidth = 0
//        self.tabBar.clipsToBounds = false
//        self.tabBar.backgroundColor = UIColor.white
//
//    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        tabBar.frame.size.height = 92
//        tabBar.frame.origin.y = view.frame.height - 92
//        tabBar.tintColor = UIColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 1)
//        tabBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//        tabBar.barTintColor = UIColor.white
//        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        self.tabBar.layer.masksToBounds = true
//        self.tabBar.isTranslucent = false
//        self.tabBar.layer.cornerRadius = 15
    var customTabBarView = UIView(frame: .zero)
            
        // MARK: View lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setupTabBarUI()
            self.addCustomTabBarView()
            
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            self.setupCustomTabBarFrame()
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
            self.tabBar.unselectedItemTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            
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
        
        private func addCustomTabBarView() {
            self.customTabBarView.frame = tabBar.frame
            
            self.customTabBarView.backgroundColor = UIColor.white
            self.customTabBarView.layer.cornerRadius = 15
            self.customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

            self.customTabBarView.layer.masksToBounds = false
            self.customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
            self.customTabBarView.layer.shadowOffset = .zero
            self.customTabBarView.layer.shadowOpacity = 1
            self.customTabBarView.layer.shadowRadius = 15
            self.view.addSubview(customTabBarView)
            self.view.bringSubviewToFront(self.tabBar)
        }
}
