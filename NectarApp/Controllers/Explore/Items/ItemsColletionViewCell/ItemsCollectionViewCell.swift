//
//  ItemsCollectionViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 21.11.2021.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemsView: UIView!
    @IBOutlet weak var productsGroupImage: UIImageView!
    @IBOutlet weak var productsGroupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
