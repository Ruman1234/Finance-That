//
//  NewlyListedTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 07/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class NewlyListedTableViewCell: UITableViewCell {

    @IBOutlet weak var newlyListedCollectionView: UICollectionView!
    @IBOutlet weak var newlyCollectionViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newlyListedCollectionView.delegate = self
        newlyListedCollectionView.dataSource = self
        
        let NewlyListedCollectionViewCellNib = UINib(nibName: "NewlyListedCollectionViewCell", bundle: nil)
        newlyListedCollectionView.register(NewlyListedCollectionViewCellNib, forCellWithReuseIdentifier: "newlyCell")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewlyListedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newlyCell", for: indexPath) as! NewlyListedCollectionViewCell
        return cell
    }
}

extension NewlyListedTableViewCell : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

}
