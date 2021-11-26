//
//  ExploreVcViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 21.11.2021.
//

import UIKit

class ExploreVcViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        registerCustomCells()
        tableView.separatorColor = .clear
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
extension ExploreVcViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBarTableViewCell", for: indexPath) as! SearchBarTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell", for: indexPath) as! ItemsTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 71.5
        } else {
            return 700
        }
    }
    
    
}
extension ExploreVcViewController {
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "SearchBarTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchBarTableViewCell")
        tableView.register(UINib.init(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")
    }
}
