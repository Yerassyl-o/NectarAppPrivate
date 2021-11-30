//
//  MyCartItemsTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 20.11.2021.
//

import UIKit

class MyCartItemsTableViewCell: UITableViewCell {
    
    var removeProductButtonTap: (() -> Void)?
    var counterButtonsTap: (() -> Void)?
    var dataBase = DefaultDataBase.shared

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
        productCount.text = "\(dataBase.getCountOfElement(nameOfProduct: productName.text!))"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func minusButtonAction(_ sender: Any) {
        minusCount()
        productCount.text = "\(dataBase.getCountOfElement(nameOfProduct: productName.text!))"
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        plusCount()
        productCount.text = "\(dataBase.getCountOfElement(nameOfProduct: productName.text!))"
        counterButtonsTap?()
    }
    
    @IBAction func removeProductButtonAction(_ sender: Any) {
        DefaultDataBase.shared.removeMyCart(nameOfProduct: productName.text ?? "")
        removeProductButtonTap?()
        counterButtonsTap?()
    }
}

extension MyCartItemsTableViewCell {
    func plusCount() {
        
        if dataBase.getCountOfElement(nameOfProduct: productName.text!) > 0 {
            DefaultDataBase.shared.plusCountMyCart(nameOfProduct: productName.text ?? "")
        }
        
    }
    
    func minusCount() {
        if dataBase.getCountOfElement(nameOfProduct: productName.text!) > 1 {
            DefaultDataBase.shared.minusCountMyCart(nameOfProduct: productName.text ?? "")
        }
    }
}
