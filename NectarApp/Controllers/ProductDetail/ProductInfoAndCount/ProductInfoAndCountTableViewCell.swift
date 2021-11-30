//
//  ProductInfoAndCountTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

protocol GetCount {
    
}

protocol ProductInfoAndCountTableViewCellDelegate: AnyObject {
    func didClickOnPlus()
    func didClickOnMinus()
}

class ProductInfoAndCountTableViewCell: UITableViewCell {
    
    weak var delegate: ProductInfoAndCountTableViewCellDelegate?
    
    let defaultDataBase = DefaultDataBase.shared
    
    let checkedImage = UIImage(named: "addFavoriteButtonSelected")!
    let unCheckedImage = UIImage(named: "addFavoriteButton")!
    var product: ProductStruct?

    
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
        checkFavorurite()
        settings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func minusButtonAction(_ sender: Any) {
        
        var count: Int = Int(productCountLabel.text ?? "1")!
        if count > 1 {
            count -= 1
            productCountLabel.text = "\(count)"
            delegate?.didClickOnMinus()
        } else {
            productCountLabel.text = "1"
        }
        
        
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        
        var count: Int = Int(productCountLabel.text ?? "1")!
        if count > 0 {
            count += 1
            productCountLabel.text = "\(count)"
            delegate?.didClickOnPlus()
        } else {
            productCountLabel.text = "1"
        }
    }
    
    @IBAction func addFovoruriteButtonAction(_ sender: Any) {
        removeAdd()
//        checkFavorurite()
        

    }
    
    
}

extension ProductInfoAndCountTableViewCell {
    
    func settings() {
        countOfProduct.layer.borderWidth = 1
        countOfProduct.layer.borderColor = CGColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        countOfProduct.layer.cornerRadius = 17
        productCountLabel.text = "1"
    }
    
    func checkFavorurite() {
        let isFavorurite = defaultDataBase.checkFavorurite(nameOfproduct:  product?.productName ?? "")
        
        if isFavorurite == true {
            
            addFovoruriteButton.setImage(checkedImage, for: UIControl.State.normal)
            
        } else if isFavorurite == false {
            
            addFovoruriteButton.setImage(unCheckedImage, for: UIControl.State.normal)
        }
    }
    
    func removeAdd() {
        let isFavorurite = defaultDataBase.checkFavorurite(nameOfproduct:  productNameLabel.text ?? "")
        if isFavorurite == true {
            defaultDataBase.removeFavorurite(nameOfproduct: productNameLabel.text ?? "")
            addFovoruriteButton.setImage(unCheckedImage, for: UIControl.State.normal)
        } else if isFavorurite == false {
            defaultDataBase.saveFavorurite(nameOfproduct: productNameLabel.text ?? "")
            addFovoruriteButton.setImage(checkedImage, for: UIControl.State.normal)
        }
        print(defaultDataBase.checkFavorurite(nameOfproduct:  productNameLabel.text ?? ""))
    }
}
