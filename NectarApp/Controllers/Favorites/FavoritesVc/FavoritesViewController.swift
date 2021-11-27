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
    override func viewDidAppear(_ animated: Bool) {
        
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productDataBase.getDataBase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let product = productDataBase.getDataBase[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
            cell.selectionStyle = .none
            cell.productImage.image = product.productImage
            cell.productName.text = product.productName
            cell.productPrice.text = "$\(product.productPrice)"
            cell.productSize.text = "\(product.productQuantity)\(product.productUnitOfMeasurement)"
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 114
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
            viewController.product = productDataBase.getDataBase[indexPath.row]
            navigationController?.pushViewController(viewController , animated: true)
        }
    }
}
extension FavoritesViewController {
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
    }
}

