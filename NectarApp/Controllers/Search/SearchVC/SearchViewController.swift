//
//  SearchViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 24.11.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    var dataBaseOfProduct = ProductDataBase()
    var searchString: String?
    var searchProductElememts: [ProductStruct] = []
    var clearButtonLogic = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customSearchBarView: UIView!
    @IBOutlet weak var customSearchBarTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCustomSearchBAr()
        collectionViewSettings()
        registerCustomCells()
     
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        customSearchBarTextField.text = ""
        textFieldEmptySettings()
    }
    
    @IBAction func filterButtonAction(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "FiltersViewController") as? FiltersViewController {
            self.present(viewController, animated: true, completion: nil)
        }
    }
}

extension SearchViewController {
    
    func collectionViewSettings() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchProductElememts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"homeScreenCategorySectionElementsCollectionViewCell", for: indexPath) as? homeScreenCategorySectionElementsCollectionViewCell else { return UICollectionViewCell() }
        
        let product = searchProductElememts[indexPath.row]
        
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
        customSearchBarTextField.addTarget(self, action: #selector(MyTextFielAction), for: UIControl.Event.primaryActionTriggered)
        customSearchBarTextField.addTarget(self, action: #selector(customSearchBarTextFieldChanged), for: .allEditingEvents)
        
        customSearchBarTextField.returnKeyType = .search
        clearButton.isHidden = true
        customSearchBarTextField.text = searchString
        
        searchLogic()
        setupToHideKeyboardOnTapOnView()
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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        textFieldEmptySettings()
    }
    
    @objc func MyTextFielAction(textField: UITextField) {
        searchString = customSearchBarTextField.text
        searchLogic()
        collectionView.reloadData()
    }
    
    func searchLogic() {
        searchProductElememts.removeAll()
        for element in dataBaseOfProduct.getDataBase {
            if element.productName.contains(searchString ?? "") {
                searchProductElememts.append(element)
            }
        }
    }
}


