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
    var selectModelArray = [SelectModelData]()
    var id  : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectTrimCollectionView.delegate = self
        selectTrimCollectionView.dataSource = self
        getTrim(id: "\(id ?? 0)")
    }
    func getTrim(id:String) {
        NetworkManager.SharedInstance.SelectTrim(viewcontroller: self,id: id) { (res) in
            print(res)
            guard let arr = res.data else{return}
            self.selectModelArray = arr
            self.selectTrimCollectionView.reloadData()
        } failure: { (err) in
            print("Failed")
            Utilities.ShowAlert(title: "ALert!!!", message: "Something went wrong", view: self)
        }
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
        return selectModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = selectModelArray[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectModelCollectionViewCell", for: indexPath) as! SelectModelCollectionViewCell
        setCollecView(view: cell.mainview)
        cell.modelLbl.text = index.v_trim
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let main = storyboard?.instantiateViewController(withIdentifier: "SelectYearViewController") as! SelectYearViewController
        self.navigationController?.pushViewController(main, animated: true)
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
