//
//  SearchViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 24.11.2021.
//

import UIKit

class SearchViewController: UIViewController {
    var clearButtonLogic = false
    @IBOutlet weak var customSearchBarView: UIView!
    @IBOutlet weak var customSearchBarTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.isHidden = true
        customSearchBarTextField.addTarget(self, action: #selector(customSearchBarTextFieldChanged), for: .allEditingEvents)
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        customSearchBarTextField.text = ""
    }
    @IBAction func filterButtonAction(_ sender: Any) {
    }
    @objc func customSearchBarTextFieldChanged(_ textField: UITextField) {
        if customSearchBarTextField.text?.count ?? 0 > 0 {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
    }
}
