//
//  GroceriesStoriesTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 23.11.2021.
//

import UIKit

class GroceriesStoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var nameCollectionLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        registerCustomCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
    }
}
extension GroceriesStoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"GroceriesStoriesStoriesCollectionViewCell", for: indexPath) as? GroceriesStoriesStoriesCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
extension GroceriesStoriesTableViewCell {
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "GroceriesStoriesStoriesCollectionViewCell", bundle: .main)
        storiesCollectionView.register(customCellNib, forCellWithReuseIdentifier: "GroceriesStoriesStoriesCollectionViewCell")
    }
}

