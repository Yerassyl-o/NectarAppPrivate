//
//  MyCartViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 20.11.2021.
//

import UIKit

class MyCartViewController: UIViewController {
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

extension MyCartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderMyCartTableViewCell", for: indexPath) as! HeaderMyCartTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCartItemsTableViewCell", for: indexPath) as! MyCartItemsTableViewCell
            let product = productDataBase.getDataBase[indexPath.row - 1]
            cell.productName.text = product.productName
            cell.productValue.text = "\(product.productQuantity)\(product.productUnitOfMeasurement), Price"
            cell.productPriceFor1Item.text = "$\(product.productPrice)"
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 57
        } else {
            return 156
        }
    }
    
}

extension MyCartViewController {
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "HeaderMyCartTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderMyCartTableViewCell")
        tableView.register(UINib.init(nibName: "MyCartItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCartItemsTableViewCell")
    }
}
