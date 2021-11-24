//
//  ProductInfoAndCountTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

class ProductInfoAndCountTableViewCell: UITableViewCell {

    @IBOutlet weak var countOfProduct: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        countOfProduct.layer.borderWidth = 1
        countOfProduct.layer.borderColor = CGColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        countOfProduct.layer.cornerRadius = 17
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
