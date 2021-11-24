//
//  ProductDetailViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var product: ProductStruct!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerCustomCells()
        tableView.separatorColor = .clear
    }
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductImagesTableViewCell", for: indexPath) as! ProductImagesTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoAndCountTableViewCell", for: indexPath) as! ProductInfoAndCountTableViewCell
            cell.selectionStyle = .none
            cell.productPrice.text = "$\(product.productPrice)"
            cell.productNameLabel.text = "\(product.productName)"
            cell.productQuantityLabel.text = "\(product.productQuantity)\(product.productUnitOfMeasurement)"
        
            return cell
            
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "productDetailTableViewCell", for: indexPath) as! productDetailTableViewCell
            cell.selectionStyle = .none
            cell.onProductDetailButtonTap = {
                self.tableView.reloadData()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "productDetailTableViewCell", for: indexPath) as! productDetailTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension ProductDetailViewController {
    func registerCustomCells(){
        
        tableView.register(UINib.init(nibName: "ProductImagesTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductImagesTableViewCell")
        tableView.register(UINib.init(nibName: "ProductInfoAndCountTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductInfoAndCountTableViewCell")
        tableView.register(UINib.init(nibName: "productDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "productDetailTableViewCell")
    }
}
