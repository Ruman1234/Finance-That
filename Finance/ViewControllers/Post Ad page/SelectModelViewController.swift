//
//  SelectModelViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 02/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SelectModelViewController: UIViewController {

    @IBOutlet weak var selectModelCollectionView: UICollectionView!
    
    let lblArr = ["Amaze","Brio","City","Civic"]
    
    var selectModelArray = [SelectModelData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectModelCollectionView.delegate = self
        selectModelCollectionView.dataSource = self
        
        PostAdNetworkManager.SharedInstance.SelectModel(viewcontroller: self) { (res) in
            print(res)
            guard let arr = res.data else{return}
            self.selectModelArray = arr
            self.selectModelCollectionView.reloadData()
        } failure: { (err) in
            print("Failed")
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

extension SelectModelViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = selectModelArray[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectModelCollectionViewCell", for: indexPath) as! SelectModelCollectionViewCell
        setCollecView(view: cell.mainview)
        cell.modelLbl.text = index.model_make
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let main = storyboard?.instantiateViewController(withIdentifier: "SelectTrimViewController") as! SelectTrimViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
}

extension SelectModelViewController: UICollectionViewDelegateFlowLayout {
    
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
