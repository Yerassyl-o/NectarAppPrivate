//
//  SearchViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 24.11.2021.
//

import UIKit

class SearchViewController: UIViewController {
    var dataBaseOfProduct = ProductDataBase()
    
    @IBOutlet weak var collectionView: UICollectionView!
    var clearButtonLogic = false
    @IBOutlet weak var customSearchBarView: UIView!
    @IBOutlet weak var customSearchBarTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCustomSearchBAr()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCustomCells()
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        customSearchBarTextField.text = ""
        textFieldEmptySettings()
    }
    
    @IBAction func filterButtonAction(_ sender: Any) {
    }
    
    
    
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("dasjfghkajlsv")
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
            viewController.product = dataBaseOfProduct.getDataBase[indexPath.row]
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
extension SearchViewController: UICollectionViewDelegateFlowLayout {}

extension SearchViewController {
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "homeScreenCategorySectionElementsCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "homeScreenCategorySectionElementsCollectionViewCell")
    }
}







extension SearchViewController {
    func setUpCustomSearchBAr() {
        clearButton.isHidden = true
        customSearchBarTextField.addTarget(self, action: #selector(customSearchBarTextFieldChanged), for: .allEditingEvents)
        setupToHideKeyboardOnTapOnView()
        customSearchBarTextField.returnKeyType = .search
    }
    @objc func customSearchBarTextFieldChanged(_ textField: UITextField) {
        textFieldEmptySettings()
    }
    
    func textFieldEmptySettings() {
        if customSearchBarTextField.text?.count ?? 0 > 0 {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
    }

    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        textFieldEmptySettings()
    }
}

