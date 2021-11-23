//
//  TableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    var dataBaseOfProduct = ProductDataBase()
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCustomCells()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataBaseOfProduct.getDataBase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"homeScreenCategorySectionElementsCollectionViewCell", for: indexPath) as? homeScreenCategorySectionElementsCollectionViewCell else { return UICollectionViewCell() }
//        let product = dataBaseOfProduct.getDataBase[indexPath.row]
//        cell.productImage.image = product.productImage
//        cell.productName.text = "\(product.productName)"
//        cell.productPrice.text = "$\(product.productPrice)"
//        cell.productValue.text = "\(product.productQuantity)\(product.productUnitOfMeasurement), Price"
            return cell
    }
    
    
}
extension ProductsTableViewCell {
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "homeScreenCategorySectionElementsCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "homeScreenCategorySectionElementsCollectionViewCell")
    }
}
