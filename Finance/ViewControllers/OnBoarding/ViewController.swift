//
//  ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 24/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var onBoardCollectionview: UICollectionView!
    
    let labels = ["For Seller","For Buyers","For Dealers"]
    let images = [UIImage(named: "Car"),UIImage(named: "Frame"),UIImage(named: "Group")]
    let labels2 = ["Sell your vehicle easily with our instant financing!","Finance any vehicle sold by a dealer or private seller!","Take advantage of our marketing to boost your sales!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onBoardCollectionview.delegate = self
        onBoardCollectionview.dataSource = self
        
        nextBtn.layer.cornerRadius = nextBtn.frame.width/2
        view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        view1.layer.cornerRadius = 4
        view2.layer.cornerRadius = 4
        view3.layer.cornerRadius = 4
        blueView.layer.backgroundColor = UIColor(red: 0.967, green: 0.979, blue: 0.988, alpha: 1).cgColor
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardCell", for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.sellerLbl.text = labels[indexPath.row]
        cell.financingLbl.text = labels2[indexPath.row]
        cell.img.image = images[indexPath.row]
        cell.backgroundColor = UIColor(red: 0.967, green: 0.979, blue: 0.988, alpha: 1)
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        changeViews()
    }
    
    func changeViews()  {
        for cell in onBoardCollectionview.visibleCells {
            let indexPath = onBoardCollectionview.indexPath(for: cell)
            
            if indexPath?.row == 0 {
                view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
                view2.layer.backgroundColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor
                view3.layer.backgroundColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor
            }else if indexPath?.row == 1 {
                view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
                view2.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
                view3.layer.backgroundColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor
            }else if indexPath?.row == 2 {
                view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
                view2.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
                view3.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: 324)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    @IBAction func skipBtn(_ sender: Any) {
//        let NotificationsStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        let NotificationsViewController = NotificationsStoryBoard.instantiateViewController(identifier: "UserPage1ViewController") as! UserPage1ViewController
//        self.navigationController?.pushViewController(NotificationsViewController, animated: true)
        
        let NotificationsStoryBoard = UIStoryboard(name: "Post Application Page", bundle: nil)
        let NotificationsViewController = NotificationsStoryBoard.instantiateViewController(identifier: "Post1ViewController") as! Post1ViewController
        self.navigationController?.pushViewController(NotificationsViewController, animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        self.onBoardCollectionview.scrollToNextItem {
            
    }
        
        let visibleRect = CGRect(origin: onBoardCollectionview.contentOffset, size: onBoardCollectionview.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = onBoardCollectionview.indexPathForItem(at: visiblePoint)
        print(visibleIndexPath)
        let visibleIndexPathRow = visibleIndexPath!.row + 1
        if visibleIndexPathRow == 0 {
            view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            view2.layer.backgroundColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor
            view3.layer.backgroundColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor
        }else if visibleIndexPathRow == 1 {
            view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            view2.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            view3.layer.backgroundColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor
        }else if visibleIndexPathRow == 2 {
            view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            view2.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            view3.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        }
    }
    
}
extension UICollectionView {
    func scrollToNextItem(res: ()->()) {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        if contentOffset > 856{
            return
        }
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
        
        res()
    }
}
