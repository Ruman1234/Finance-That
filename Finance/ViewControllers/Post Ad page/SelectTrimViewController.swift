//
//  SelectTrimViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 02/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SelectTrimViewController: UIViewController {

    @IBOutlet weak var selectTrimCollectionView: UICollectionView!
    
    let lblArr = ["1.5 EMT I DTEC","1.5 S CVT Diesel","1.5 S CVT Diesel","1.5 EMT I DTEC","1.5 S CVT Diesel","1.5 EMT I DTEC"]

    override func viewDidLoad() {
        super.viewDidLoad()
        selectTrimCollectionView.delegate = self
        selectTrimCollectionView.dataSource = self
    }
    
    func setCollecView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.988, blue: 0.992, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
}

extension SelectTrimViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lblArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectModelCollectionViewCell", for: indexPath) as! SelectModelCollectionViewCell
        setCollecView(view: cell.mainview)
        cell.modelLbl.text = lblArr[indexPath.row]
        return cell
    }
    
    
}

extension SelectTrimViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 162, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
