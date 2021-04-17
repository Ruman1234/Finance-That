//
//  TypeOfVehicleViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 02/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class TypeOfVehicleViewController: UIViewController {

    @IBOutlet weak var typeOfVehicleCollectionView: UICollectionView!
    
    let imagesArr = [UIImage(named: "Automotive"),UIImage(named: "Motorcycle"),UIImage(named: "Powersport"),UIImage(named: "RV"),UIImage(named: "Boat"),UIImage(named: "Trailer"),UIImage(named: "Small Equipment")]
    let lblArr = ["Automotive","Motorcycle","Powersport","RV","Boat","Trailer","Small Equipment"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeOfVehicleCollectionView.delegate = self
        typeOfVehicleCollectionView.dataSource = self
    }
    
    func setCollecView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.988, blue: 0.992, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
}

extension TypeOfVehicleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeOfVehicleCollectionViewCell", for: indexPath) as! TypeOfVehicleCollectionViewCell
        setCollecView(view: cell.mainView)
        cell.vehicleImg.image = imagesArr[indexPath.row]
        cell.vehicleNameLbl.text = lblArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let main = storyboard?.instantiateViewController(withIdentifier: "SelectMakeViewController") as! SelectMakeViewController
            self.navigationController?.pushViewController(main, animated: true)

        }
    }
}

extension TypeOfVehicleViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
