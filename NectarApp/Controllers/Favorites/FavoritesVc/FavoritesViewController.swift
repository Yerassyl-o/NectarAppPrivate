//
//  FavoritesViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import UIKit

class FavoritesViewController: UIViewController {
    var productDataBase = ProductDataBase()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerCustomCells()
        tableView.separatorInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .clear
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productDataBase.getDataBase.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderFavoritesTableViewCell", for: indexPath) as! HeaderFavoritesTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let product = productDataBase.getDataBase[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
            cell.selectionStyle = .none
            cell.productImage.image = product.productImage
            cell.productName.text = product.productName
            cell.productPrice.text = "$\(product.productPrice)"
            cell.productSize.text = "\(product.productQuantity)\(product.productUnitOfMeasurement)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 57
        } else {
            return 114
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
            print("hello asfgsgs")
            viewController.product = productDataBase.getDataBase[indexPath.row]
            navigationController?.pushViewController(viewController , animated: true)
        }
    }
}
extension FavoritesViewController {
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
        tableView.register(UINib.init(nibName: "HeaderFavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderFavoritesTableViewCell")
    }
}
