//
//  HomeSreenBannerTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 22.11.2021.
//

import UIKit

class HomeSreenBannerTableViewCell: UITableViewCell {
    var timer: Timer?
    var currentCellIndex = 0
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCustomCells()
        collectionView.layer.cornerRadius = 8
        
    }
    override func layoutSubviews() {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func slideToNext(){
        
        if currentCellIndex < 2 {
            currentCellIndex += 1
        } else {
            currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .left, animated: true)
        pageControl.currentPage = Int(currentCellIndex)
    }
    
}

extension HomeSreenBannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"HomeSreenBannerCollectionViewCell", for: indexPath) as? HomeSreenBannerCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
    }
}

extension HomeSreenBannerTableViewCell{
    func registerCustomCells(){
        let customCellNib = UINib(nibName: "HomeSreenBannerCollectionViewCell", bundle: .main)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: "HomeSreenBannerCollectionViewCell")
    }
}
