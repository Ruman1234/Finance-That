//
//  PrivateSellerViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 24/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class PrivateSellerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var carNameCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var purpleView1: UIView!
    @IBOutlet weak var purpleView2: UIView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var carNamesCollectionView: UICollectionView!
    @IBOutlet weak var carDetailCollectionView: UICollectionView!
    
    let LblNamesArr = ["Best Match","Near Me","Oldest","Newest","Lowest Price","Highest Price","New Arrivals","Lowest Mileage","Highest Mileage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carNamesCollectionView.delegate = self
        carNamesCollectionView.dataSource = self
        
        carDetailCollectionView.delegate = self
        carDetailCollectionView.dataSource = self
        
//        carNamesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        carNamesCollectionView.collectionViewLayout = layout
        carNamesCollectionView.isScrollEnabled = true
                
//        let height = carNamesCollectionView.collectionViewLayout.collectionViewContentSize.height
//        carNameCollectionViewHeight.constant = height
//        carNamesCollectionView.layoutIfNeeded()
        
        
    }
    
    
    @IBAction func filterBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "ActionSheetViewController") as! ActionSheetViewController
        main.modalPresentationStyle = .overCurrentContext
        main.modalTransitionStyle = .crossDissolve
        main.LblNamesArr = LblNamesArr
        present(main, animated: true, completion: nil)
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
      
        if collectionView == carNamesCollectionView {
            return CGSize(width: 97, height: 35)
        }else {
            return CGSize(width: 97, height: 220)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension PrivateSellerViewController:ActionSheetViewControllerDelegate{
    func didSendBAck(Index: Int, Selection: String) {
        
    }
    
    func didClose() {
        
    }
    
    
}
