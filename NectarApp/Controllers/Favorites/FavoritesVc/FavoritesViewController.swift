//
//  FavoritesViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import UIKit

class FavoritesViewController: UIViewController {
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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderFavoritesTableViewCell", for: indexPath) as! HeaderFavoritesTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
            cell.selectionStyle = .none
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
}
extension FavoritesViewController {
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
        tableView.register(UINib.init(nibName: "HeaderFavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderFavoritesTableViewCell")
    }
}
