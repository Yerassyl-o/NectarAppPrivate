//
//  MenuTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuIconImage: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuOpenButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
