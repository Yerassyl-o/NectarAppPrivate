//
//  LogOutTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import UIKit

class LogOutTableViewCell: UITableViewCell {
    var buttonClicked = false
    @IBOutlet weak var logOutButton: UIButton!
    var logOutButtonTap: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func logOutButtonAction(_ sender: Any) {
        buttonClicked.toggle()
        logOutButtonTap?()
    }
    
}
