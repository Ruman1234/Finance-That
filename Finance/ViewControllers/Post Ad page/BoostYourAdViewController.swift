//
//  BoostYourAdViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class BoostYourAdViewController: UIViewController {
    
    @IBOutlet weak var boostAdCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boostAdCollectionView.delegate = self
        boostAdCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        boostAdCollectionView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    
    
}

extension BoostYourAdViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoostYourAdCollectionViewCell", for: indexPath) as! BoostYourAdCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let main = storyboard?.instantiateViewController(withIdentifier: "PostAdViewController") as! PostAdViewController
            self.navigationController?.pushViewController(main, animated: true)
        }else{
            let main = storyboard?.instantiateViewController(withIdentifier: "PaymentMethodViewController") as! PaymentMethodViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
        
        
    }
    
}
extension BoostYourAdViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 272, height: 479)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
