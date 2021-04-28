//
//  TypeOfVehicleViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 02/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import SDWebImage
import SVGKit

class TypeOfVehicleViewController: UIViewController {
    
    @IBOutlet weak var typeOfVehicleCollectionView: UICollectionView!
    
    var typeVehicleArray = [TypeOfVehicleData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeOfVehicleCollectionView.delegate = self
        typeOfVehicleCollectionView.dataSource = self
        getVehicle()
      
    }
    
    func getVehicle(){
        NetworkManager.SharedInstance.TypeOfVehicle(viewcontroller: self) { (res) in
            //            print(res)
            guard let arr = res.data else{return}
            self.typeVehicleArray = arr
            self.typeOfVehicleCollectionView.reloadData()
        } failure: { (err) in
            print("Failed")
            Utilities.ShowAlert(title: "Alert!!!", message: "something went wrong", view: self)
        }
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
        return typeVehicleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = typeVehicleArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeOfVehicleCollectionViewCell", for: indexPath) as! TypeOfVehicleCollectionViewCell
        setCollecView(view: cell.mainView)
        let mySVGImage: SVGKImage = SVGKImage(contentsOf: URL(string: index.image_path ?? "")!)
        cell.vehicleImg.image = mySVGImage.uiImage
        cell.vehicleNameLbl.text = index.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = typeOfVehicleCollectionView.cellForItem(at: indexPath)  as! TypeOfVehicleCollectionViewCell
        let indexData = typeVehicleArray[indexPath.row]
        POSTAd.vehicleTypeID = indexData.id?.toString()
        if index.vehicleNameLbl.text == ""{
            let main = storyboard?.instantiateViewController(withIdentifier: "PowerSportVehicleViewController") as! PowerSportVehicleViewController
            main.collectionArray = indexData.typeofvehicle_id!
            self.navigationController?.pushViewController(main, animated: true)
        }else{
            let main = storyboard?.instantiateViewController(withIdentifier: "SelectMakeViewController") as! SelectMakeViewController
            main.id = indexData.id
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
