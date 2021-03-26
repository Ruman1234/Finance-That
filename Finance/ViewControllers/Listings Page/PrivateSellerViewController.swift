//
//  PrivateSellerViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 24/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class PrivateSellerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var purpleView1: UIView!
    @IBOutlet weak var purpleView2: UIView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var carNamesCollectionView: UICollectionView!
    @IBOutlet weak var carDetailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carNamesCollectionView.delegate = self
        carNamesCollectionView.dataSource = self
        
        carDetailCollectionView.delegate = self
        carDetailCollectionView.dataSource = self
        
        carNamesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == self.carNamesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carCell", for: indexPath) as! CarNamesCollectionViewCell
            return cell

        }else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carDetail", for: indexPath) as! CarDetailCollectionViewCell
            return cell
        }
    }
    
}

extension PrivateSellerViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.carNamesCollectionView {
            let collectionWidth = collectionView.bounds.width
            return CGSize (width: collectionWidth/2, height: collectionWidth/2)
        }else {
            let collectionWidth = collectionView.bounds.width
            return CGSize (width: collectionWidth/2, height: collectionWidth/2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

