//
//  CollectionProductsViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 26.11.2021.
//

import UIKit

class CollectionProductsViewController: MainViewController {
    
    var dataBaseOfProduct = ProductDataBase()
    var productCategory: String!
    var productsOfCategory: [ProductStruct] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewSettings()
        registerCustomCells()
        navBarSettings()
        
        
    }
}

extension CollectionProductsViewController{
    
    func collectionViewSettings(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        for item in 0 ..< dataBaseOfProduct.getDataBase.count {
            if dataBaseOfProduct.getDataBase[item].productCategory == productCategory {
                productsOfCategory.append(dataBaseOfProduct.getDataBase[item])
            }
        }
    }
    
    func navBarSettings() {
        navigationItem.title = productCategory ?? "Error"
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
        productsOfCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"homeScreenCategorySectionElementsCollectionViewCell", for: indexPath) as? homeScreenCategorySectionElementsCollectionViewCell else { return UICollectionViewCell() }
        
        let product = productsOfCategory[indexPath.row]
        
        cell.productImage.image = product.productImage
        cell.productName.text = "\(product.productName)"
        cell.productPrice.text = "$\(product.productPrice)"
        cell.productValue.text = "\(product.productQuantity)\(product.productUnitOfMeasurement), Price"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = self.collectionView.frame.width
        return CGSize(width: (collectionViewWidth - 20)/2, height: 260)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = self.storyboard?.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController {
            viewController.product = productsOfCategory[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
extension CollectionProductsViewController: UICollectionViewDelegateFlowLayout {}

extension CollectionProductsViewController {
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "homeScreenCategorySectionElementsCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "homeScreenCategorySectionElementsCollectionViewCell")
    }
}

