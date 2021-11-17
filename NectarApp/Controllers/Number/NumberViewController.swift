//
//  NumberViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 16.11.2021.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet weak var numberEnterField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpnumberEnterField()
    }
}

extension NumberViewController {
    func setUpnumberEnterField(){
        numberEnterField.keyboardType = .phonePad
    }
}
