//
//  ParametrElementsTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 24.11.2021.
//

import UIKit

class ParametrElementsTableViewCell: UITableViewCell {

    @IBOutlet weak var parametrNameLabel: UILabel!
    @IBOutlet weak var parametrNameButton: UIButton!
    @IBOutlet weak var parametrButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func parametrButtonAction(_ sender: Any) {}
    @IBAction func parametrNameButtonAction(_ sender: Any) {}
}
