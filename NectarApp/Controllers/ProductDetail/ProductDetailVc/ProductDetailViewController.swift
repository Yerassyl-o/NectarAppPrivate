//
//  ProductDetailViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

class ProductDetailViewController: MainViewController {
    
    var defaultDataBase = DefaultDataBase.shared
    var count: Int?
    var productName: String?
    var product: ProductStruct!
    
//    var product = ProductStruct(productName: "Diet Coke",
//                                productUnitOfMeasurement: "ml",
//                                productQuantity: 355,
//                                productPrice: "1.99",
//                                productCategory: "Beverages",
//                                productReview: 4,
//                                productImage: UIImage(named: "Diet Coke") ?? UIImage(named:"defaultProductImage")!)
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSettings()
        registerCustomCells()
        navigationBarSettings()
        
    }
    
    @IBAction func AddToBasketButtonAction(_ sender: Any) {}
}

extension ProductDetailViewController {
    
    func tableViewSettings(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
    }
    
    func navigationBarSettings(){
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = leftItem
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBar.tintColor = .black
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
            cell.productName = self.product.productName
            
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
            
        } else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionsTableViewCell", for: indexPath) as! NutritionsTableViewCell
            cell.selectionStyle = .none
            
            return cell
            
        }  else if indexPath.row == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
            cell.selectionStyle = .none
            
            return cell
            
        }  else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionsTableViewCell", for: indexPath) as! NutritionsTableViewCell
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
        tableView.register(UINib.init(nibName: "NutritionsTableViewCell", bundle: nil), forCellReuseIdentifier: "NutritionsTableViewCell")
        tableView.register(UINib.init(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
    }
}
