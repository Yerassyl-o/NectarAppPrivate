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
        setupToHideKeyboardOnTapOnView()
        customSearchBarTextField.returnKeyType = .search
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        customSearchBarTextField.text = ""
        textFieldEmptySettings()
    }
    @IBAction func filterButtonAction(_ sender: Any) {
    }
    @objc func customSearchBarTextFieldChanged(_ textField: UITextField) {
        textFieldEmptySettings()
    }
}
extension SearchViewController {
    
    func textFieldEmptySettings() {
        if customSearchBarTextField.text?.count ?? 0 > 0 {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
    }
    
    
    
    
    
    
    
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        textFieldEmptySettings()
    }
}
