//
//  ProductInfoAndCountTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

class ProductInfoAndCountTableViewCell: UITableViewCell {
    
    
    
    
    let checkedImage = UIImage(named: "addFavoriteButton")!
    let unCheckedImage = UIImage(named: "addFavoriteButtonSelected")!
    
    var logicAddFovoruriteButton = false
    @IBOutlet weak var countOfProduct: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var addFovoruriteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        countOfProduct.layer.borderWidth = 1
        countOfProduct.layer.borderColor = CGColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        countOfProduct.layer.cornerRadius = 17
        productCountLabel.text = "1"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func minusButtonAction(_ sender: Any) {
        var count: Int = Int(productCountLabel.text ?? "1")!
        if count > 1 {
            count -= 1
            productCountLabel.text = "\(count)"
        } else {
            productCountLabel.text = "1"
        }
    }
    @IBAction func plusButtonAction(_ sender: Any) {
        var count: Int = Int(productCountLabel.text ?? "1")!
        if count > 0 {
            count += 1
            productCountLabel.text = "\(count)"
        } else {
            productCountLabel.text = "1"
        }
    }
    @IBAction func addFovoruriteButtonAction(_ sender: Any) {
        
        if logicAddFovoruriteButton == false {
            addFovoruriteButton.setImage(checkedImage, for: UIControl.State.normal)
            logicAddFovoruriteButton.toggle()
        } else {
            addFovoruriteButton.setImage(unCheckedImage, for: UIControl.State.normal)
            logicAddFovoruriteButton.toggle()
            
        }
        
    }
}
