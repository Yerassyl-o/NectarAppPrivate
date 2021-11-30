//
//  AccountInfoTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import UIKit

class AccountInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameSurnameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userEditButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func userEditButtonAction(_ sender: Any) {
    }
}
