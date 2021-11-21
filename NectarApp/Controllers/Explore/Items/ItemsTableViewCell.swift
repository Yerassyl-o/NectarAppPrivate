//
//  ItemsTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 21.11.2021.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        registerCustomCells()
    }
    
}

extension ItemsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ItemsCollectionViewCell", for: indexPath) as? ItemsCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 190)
    }
}

extension ItemsTableViewCell{
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "ItemsCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "ItemsCollectionViewCell")
    }
}
