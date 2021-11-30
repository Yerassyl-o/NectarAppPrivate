//
//  homeScreenCategorySectionTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 22.11.2021.
//

import UIKit

class homeScreenCategorySectionTableViewCell: UITableViewCell {
    
    var dataBaseOfProduct = ProductDataBase()
    var productTaped: (() -> Void)?
    var product: ProductStruct?
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionViewSettings()
        registerCustomCells()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func seeAllButtonAction(_ sender: Any) {
    }
}

extension homeScreenCategorySectionTableViewCell {
    
    func collectionViewSettings(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension homeScreenCategorySectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataBaseOfProduct.getDataBase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"homeScreenCategorySectionElementsCollectionViewCell", for: indexPath) as? homeScreenCategorySectionElementsCollectionViewCell else { return UICollectionViewCell() }
        
        let product = dataBaseOfProduct.getDataBase[indexPath.row]
        
        cell.productImage.image = product.productImage
        cell.productName.text = "\(product.productName)"
        cell.productPrice.text = "$\(product.productPrice)"
        cell.productValue.text = "\(product.productQuantity)\(product.productUnitOfMeasurement), Price"
        
        return cell
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity
    velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        targetContentOffset.pointee = scrollView.contentOffset
        
        var indexes = self.collectionView.indexPathsForVisibleItems
        indexes.sort()
        var index = indexes.first!
        let cell = self.collectionView.cellForItem(at: index)!
        let position = self.collectionView.contentOffset.x - cell.frame.origin.x
        
        if position > cell.frame.size.width/2{
            index.row = index.row + 1
        }
        
        self.collectionView.scrollToItem(at: index, at: .left, animated: true )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let getProduct = dataBaseOfProduct.getDataBase[indexPath.row]

        product = getProduct
        productTaped?()
    }
}

extension homeScreenCategorySectionTableViewCell {
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "homeScreenCategorySectionElementsCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "homeScreenCategorySectionElementsCollectionViewCell")
    }
}
