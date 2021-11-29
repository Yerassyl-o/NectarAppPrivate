//
//  ViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 29.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        (tabBarController as? CustomTabABarvc)?.customTabBarView.isHidden = hidesBottomBarWhenPushed
    }
}
