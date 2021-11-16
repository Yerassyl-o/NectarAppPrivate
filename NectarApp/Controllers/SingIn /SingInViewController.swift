//
//  SingInViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 16.11.2021.
//

import UIKit

class SingInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension SingInViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}
