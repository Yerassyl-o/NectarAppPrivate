//
//  FavoritesViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var addAllToCartButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerCustomCells()
        setUpConstraintsButton()
    }
    @IBAction func addAllToCartButtonAction(_ sender: Any) {
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderFavoritesTableViewCell", for: indexPath) as! HeaderFavoritesTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
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
    func setUpConstraintsButton(){
        addAllToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addAllToCartButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        addAllToCartButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 24).isActive = true
        addAllToCartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 117).isActive = true
    }
}
