//
//  homeScreeSearchBarTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 22.11.2021.
//

import UIKit

class homeScreeSearchBarTableViewCell: UITableViewCell {

    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSearch.layer.cornerRadius = 15
        searchTextField.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
