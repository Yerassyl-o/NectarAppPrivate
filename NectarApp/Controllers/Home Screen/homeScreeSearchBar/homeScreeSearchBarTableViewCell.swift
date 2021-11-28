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
        customSearchBarTextField.addTarget(self, action: #selector(MyTextFielAction)
                                       , for: UIControl.Event.primaryActionTriggered)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clearButtonAction(_ sender: Any) {
        customSearchBarTextField.text = ""
        clearButton.isHidden = true
    }
    @objc func MyTextFielAction(textField: UITextField) {
        print("asjcfdkahgslfdsvfvadsvfvdslvfvasdvjf")
        
    }
    
}

extension homeScreeSearchBarTableViewCell {
    func setUpCustomSearchBAr() {
        clearButton.isHidden = true
        customSearchBarTextField.addTarget(self, action: #selector(customSearchBarTextFieldChanged), for: .allEditingEvents)
        customSearchBarTextField.returnKeyType = .search
    }
    @objc func customSearchBarTextFieldChanged(_ textField: UITextField) {
        if customSearchBarTextField.text?.count ?? 0 > 0 {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
    }
}
