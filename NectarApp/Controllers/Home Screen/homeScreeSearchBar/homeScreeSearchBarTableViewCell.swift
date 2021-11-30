//
//  homeScreeSearchBarTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 22.11.2021.
//

import UIKit

class homeScreeSearchBarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customSearchBarView: UIView!
    @IBOutlet weak var customSearchBarTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCustomSearchBAr()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        customSearchBarTextField.text = ""
        clearButton.isHidden = true
    }
    
    
}

extension homeScreeSearchBarTableViewCell {
    
    func setUpCustomSearchBAr() {
        customSearchBarTextField.addTarget(self, action: #selector(MyTextFielAction), for: UIControl.Event.primaryActionTriggered)
        customSearchBarTextField.addTarget(self, action: #selector(customSearchBarTextFieldChanged), for: .allEditingEvents)
        
        clearButton.isHidden = true
        customSearchBarTextField.returnKeyType = .search
    }
    
    @objc func customSearchBarTextFieldChanged(_ textField: UITextField) {
        if customSearchBarTextField.text?.count ?? 0 > 0 {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
    }
    
    @objc func MyTextFielAction(textField: UITextField) {}

}
