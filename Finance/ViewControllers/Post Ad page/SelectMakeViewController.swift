//
//  SelectMakeViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 02/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SelectMakeViewController: UIViewController {

    @IBOutlet weak var selectMakeTextField: CustomTextField!
    @IBOutlet weak var provideMakeTextField: CustomTextField!
    @IBOutlet weak var vehicleBrandCollectionView: UICollectionView!
    
    let imagesArr = [UIImage(named: "Honda"),UIImage(named: "Toyota"),UIImage(named: "Nisan"),UIImage(named: "Hyundai"),UIImage(named: "Mazda"),UIImage(named: "Ford"),UIImage(named: "Chevrolet"),UIImage(named: "Volkswagcn"),UIImage(named: "Audi"),UIImage(named: "Lexus"),UIImage(named: "Mercedes"),UIImage(named: "Porsche")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehicleBrandCollectionView.delegate = self
        vehicleBrandCollectionView.dataSource = self
    }
    
    func setCollecView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.988, blue: 0.992, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
    
    @IBAction func crossBtn(_ sender: Any) {
    }
}

extension SelectMakeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleBrandsCollectionViewCell", for: indexPath) as! VehicleBrandsCollectionViewCell
        setCollecView(view: cell.mainView)
        cell.brandImg.image = imagesArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let main = storyboard?.instantiateViewController(withIdentifier: "SelectModelViewController") as! SelectModelViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
}

extension SelectMakeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 73, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
}