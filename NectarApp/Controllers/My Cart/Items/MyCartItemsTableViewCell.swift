//
//  MyCartItemsTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 20.11.2021.
//

import UIKit

class MyCartItemsTableViewCell: UITableViewCell {
    var productCounter = 1
    var shareCount: Int {
        return productCounter
    }
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productValue: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var productPriceFor1Item: UILabel!
    @IBOutlet weak var removeProductButton: UIButton!
    @IBOutlet weak var productCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        productCount.text = "\(productCounter)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func minusButtonAction(_ sender: Any) {
        minusCount()
        productCount.text = "\(productCounter)"
        print(productCounter)
    }
    @IBAction func plusButtonAction(_ sender: Any) {
        plusCount()
        productCount.text = "\(productCounter)"
    }
    
    @IBAction func removeProductButtonAction(_ sender: Any) {
    }
}

extension MyCartItemsTableViewCell {
    func plusCount() {
        
        if productCounter > 0 {
            productCounter += 1
        }
    }
    func minusCount() {
        if productCounter != 1 {
            productCounter -= 1
        } else {
            productCounter = 1
        }
    }
}
