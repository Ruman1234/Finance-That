//
//  SelectMakeViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 02/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import SVGKit
class SelectMakeViewController: UIViewController {
    
    @IBOutlet weak var selectMakeTextField: CustomTextField!
    @IBOutlet weak var provideMakeTextField: CustomTextField!
    @IBOutlet weak var vehicleBrandCollectionView: UICollectionView!
    
    var selectMakeArray = [SelectMakeData]()
    var selectQuickMakeArray = [SelectMakeData]()
    var id:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicleBrandCollectionView.delegate = self
        vehicleBrandCollectionView.dataSource = self
        getMake(id: "\(id ?? 0)")
    }
    
    func getMake(id : String)  {
        NetworkManager.SharedInstance.SelectMake(viewcontroller: self,id: id) { (res) in
            guard let arr = res.data else{return}
            self.selectMakeArray = arr
            self.selectQuickMakeArray = arr
            
            self.selectQuickMakeArray = self.selectMakeArray.filter { (res) -> Bool in
                return res.image_path != nil
            }
            
            self.vehicleBrandCollectionView.reloadData()
        } failure: { (err) in
            Utilities.ShowAlert(title: "Alert", message: "Something went wrong", view: self)
        }
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
        return selectQuickMakeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = selectQuickMakeArray[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleBrandsCollectionViewCell", for: indexPath) as! VehicleBrandsCollectionViewCell
        setCollecView(view: cell.mainView)
        
        cell.brandImg.sd_setImage(with: URL(string: Constants.BASE_URL_Images + index.image_path!), placeholderImage:UIImage(contentsOfFile:"placeholder.png"))
        
        //        let mySVGImage: SVGKImage = SVGKImage(contentsOf: URL(string:Constants.BASE_URL_Images + index.image_path!)!)
        //        cell.brandImg.image = mySVGImage.uiImage
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = selectQuickMakeArray[indexPath.row]
        let main = storyboard?.instantiateViewController(withIdentifier: "SelectModelViewController") as! SelectModelViewController
        main.id = index.id
        self.navigationController?.pushViewController(main, animated: true)
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
