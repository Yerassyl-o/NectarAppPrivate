//
//  homeScreenCategorySectionElementsCollectionViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 22.11.2021.
//

import UIKit

class homeScreenCategorySectionElementsCollectionViewCell: UICollectionViewCell {
    
    let dataBase = DefaultDataBase.shared

    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productValue: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productAddButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productViewSettings()
    }

    @IBAction func productAddButtonAction(_ sender: Any) {
        dataBase.saveMyCart(product: productName.text ?? "Pepsi Can", count: 1)
        
    }
}

extension homeScreenCategorySectionElementsCollectionViewCell {
    
    func productViewSettings(){
        productView.layer.cornerRadius = 18
        productView.layer.borderWidth = 1
        productView.layer.borderColor = CGColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
    }
}
