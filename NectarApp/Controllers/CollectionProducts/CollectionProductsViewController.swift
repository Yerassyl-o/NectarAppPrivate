//
//  CollectionProductsViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 26.11.2021.
//

import UIKit

class CollectionProductsViewController: UIViewController {
    var dataBaseOfProduct = ProductDataBase()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCustomCells()
        navigationItem.title = "Beverages"
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ilterIconSvg"), style: .plain, target: self, action: #selector(filterButton))
        
        
            
    }
    @objc func filterButton(_ button: UIBarButtonItem){
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "FiltersViewController") as? FiltersViewController {
            navigationController?.pushViewController(viewController , animated: true)
        }
        
    }
}


extension CollectionProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = self.collectionView.frame.width
        print("dsd")
        return CGSize(width: (collectionViewWidth - 20)/2, height: 260)
        
    }
    
    
}
extension CollectionProductsViewController: UICollectionViewDelegateFlowLayout {}

extension CollectionProductsViewController {
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "homeScreenCategorySectionElementsCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "homeScreenCategorySectionElementsCollectionViewCell")
    }
}

