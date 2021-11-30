//
//  GroceriesStoriesStoriesCollectionViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

class GroceriesStoriesStoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var stroriesView: UIView!
    @IBOutlet weak var imageStories: UIImageView!
    @IBOutlet weak var labelStories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stroriesView.layer.opacity = 0.15
        stroriesView.layer.cornerRadius = 18
    }

}
