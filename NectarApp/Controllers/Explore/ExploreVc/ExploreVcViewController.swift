//
//  ExploreVcViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 21.11.2021.
//

import UIKit

class ExploreVcViewController: UIViewController {
    let exploreCollectionsProductsBase = ExploreCollectionsProducts()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customSearchBarView: UIView!
    @IBOutlet weak var customSearchBarTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        registerCustomCells()
        collectionView.sizeToFit()
        navigationController?.navigationBar.shadowImage = UIImage()
        customSearchBarTextField.addTarget(self, action: #selector(MyTextFielAction)
                                       , for: UIControl.Event.primaryActionTriggered)
        setupToHideKeyboardOnTapOnView()
        setUpCustomSearchBAr()
    }
    @IBAction func clearButtonAction(_ sender: Any) {
        customSearchBarTextField.text = ""
        clearButton.isHidden = true
    }
    @objc func MyTextFielAction(textField: UITextField) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController {
            viewController.modalPresentationStyle = .popover
            self.present(viewController, animated: true, completion: nil)
//            navigationController?.pushViewController(viewController , animated: true)
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
    }
}

extension ExploreVcViewController {
    func setUpCustomSearchBAr() {
        clearButton.isHidden = true
        customSearchBarTextField.addTarget(self, action: #selector(customSearchBarTextFieldChanged), for: .allEditingEvents)
        customSearchBarTextField.returnKeyType = .search
    }
    @objc func customSearchBarTextFieldChanged(_ textField: UITextField) {
        if customSearchBarTextField.text?.count ?? 0 > 0 {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
    }
}

extension ExploreVcViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        
        return CGSize(width: (collectionViewWidth - 18)/2, height: 190)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "CollectionProductsViewController") as? CollectionProductsViewController {
            viewController.productCategory = exploreCollectionsProductsBase.getExploreCollectionsProductsBase[indexPath.row].collectionName
            navigationController?.pushViewController(viewController , animated: true)
        }
        
    }
}
extension ExploreVcViewController: UICollectionViewDelegateFlowLayout {
}

extension ExploreVcViewController{
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "ItemsCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "ItemsCollectionViewCell")
    }
}

