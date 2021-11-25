//
//  ItemsTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 21.11.2021.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    let exploreCollectionsProductsBase = ExploreCollectionsProducts()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCustomCells()
        collectionView.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension ItemsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        exploreCollectionsProductsBase.getExploreCollectionsProductsBase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ItemsCollectionViewCell", for: indexPath) as? ItemsCollectionViewCell else {
                return UICollectionViewCell()
            }
        let collectionsProducts = exploreCollectionsProductsBase.getExploreCollectionsProductsBase[indexPath.item]
        cell.productsGroupImage.image = collectionsProducts.collectionImage
        cell.productsGroupName.text = collectionsProducts.collectionName
        cell.itemsView.backgroundColor = collectionsProducts.collectionBackgroundColor
        cell.itemsView.layer.borderWidth = 1
        cell.itemsView.layer.borderColor = collectionsProducts.borderColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = self.collectionView.frame.width
        
        return CGSize(width: (collectionViewWidth - 15)/2, height: 200)
    }
}
extension ItemsTableViewCell: UICollectionViewDelegateFlowLayout {
}

extension ItemsTableViewCell{
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "ItemsCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "ItemsCollectionViewCell")
    }
}
