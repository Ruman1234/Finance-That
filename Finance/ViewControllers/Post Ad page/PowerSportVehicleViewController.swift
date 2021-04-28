//
//  PowerSportVehicleViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 02/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import SVGKit

class PowerSportVehicleViewController: UIViewController {

    @IBOutlet weak var powerSportVehicleCollectionView: UICollectionView!
    
    let imagesArr = [UIImage(named: "snowmobile"),UIImage(named: "jetski"),UIImage(named: "motorbike")]
    let lblArr = ["Snowmobile","WaterCraft","ATV/UTV"]
    var collectionArray = [TypeofVehicle_id]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        powerSportVehicleCollectionView.delegate = self
        powerSportVehicleCollectionView.dataSource = self
    }
    
    func setCollecView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.988, blue: 0.992, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
}

extension PowerSportVehicleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = collectionArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PowerSportCollectionViewCell", for: indexPath) as! PowerSportCollectionViewCell
        setCollecView(view: cell.mainview)
        let mySVGImage: SVGKImage = SVGKImage(contentsOf: URL(string: index.image_path ?? "")!)
        cell.vehicleimg.image = mySVGImage.uiImage
        cell.vehicleLbl.text = index.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = collectionArray[indexPath.row]
        if indexPath.row == 0 {
            let main = storyboard?.instantiateViewController(withIdentifier: "SelectMakeViewController") as! SelectMakeViewController
            main.id = index.type_id
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
}

extension PowerSportVehicleViewController: UICollectionViewDelegateFlowLayout {
    
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
