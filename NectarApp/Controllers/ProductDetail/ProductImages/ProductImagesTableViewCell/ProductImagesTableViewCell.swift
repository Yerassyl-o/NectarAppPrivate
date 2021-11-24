//
//  ProductImagesTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

class ProductImagesTableViewCell: UITableViewCell {
    var dateBaseOfProduct = ProductDataBase()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var uiViewContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCustomCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        uiViewContainer.roundCorners([.bottomLeft, .bottomRight], radius: 25)
    }
    
}
extension ProductImagesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ProductImagesCollectionViewCell", for: indexPath) as? ProductImagesCollectionViewCell else { return UICollectionViewCell() }
//        cell.productImage.image = dateBaseOfProduct.getDataBase[5].productImage
        return cell
    }
}

extension ProductImagesTableViewCell {
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "ProductImagesCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "ProductImagesCollectionViewCell")
    }
}

extension UIView {
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
      }
}
