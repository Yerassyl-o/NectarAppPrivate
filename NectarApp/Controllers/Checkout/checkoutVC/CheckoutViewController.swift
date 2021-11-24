//
//  CheckoutViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 24.11.2021.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageNameLabel: UILabel!
    @IBOutlet weak var closebutton: UIButton!
    @IBOutlet weak var placeOrderBuuton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        registerCustomCells()
    }
    @IBAction func closeButtonAction(_ sender: Any) {
    }
    @IBAction func placeOrderButtonAction(_ sender: Any) {
    }
}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParametrElementFooterTableViewCell", for: indexPath) as! ParametrElementFooterTableViewCell
            cell.selectionStyle = .none
            return cell
        }  else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParametrElementsTableViewCell", for: indexPath) as! ParametrElementsTableViewCell
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
extension CheckoutViewController {
    
    func registerCustomCells(){
        
        tableView.register(UINib.init(nibName: "ParametrElementsTableViewCell", bundle: nil), forCellReuseIdentifier: "ParametrElementsTableViewCell")
        tableView.register(UINib.init(nibName: "ParametrElementFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "ParametrElementFooterTableViewCell")
    }
    
}
