//
//  ListDetailsViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 30/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ListDetailsViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var carDetailLbl: UILabel!
    @IBOutlet weak var CarImg: UIImageView!
    @IBOutlet weak var CarNameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var minutesAgoLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var caculatePriceLbl: UILabel!
    @IBOutlet weak var ATVUTVLbl: UILabel!
    
//  MARK:- OverView Labels
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var makeLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var trimLbl: UILabel!
    @IBOutlet weak var kmLbl: UILabel!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var profilePicLbl: UIImageView!
    @IBOutlet weak var profileNameLbl: UILabel!
    
//  MARK:- Vehicle Detail Labels
    @IBOutlet weak var bodyTypeLbl: UILabel!
    @IBOutlet weak var seatingLbl: UILabel!
    @IBOutlet weak var exteriorColor: UILabel!
    @IBOutlet weak var fuelType: UILabel!
    @IBOutlet weak var transmissionLbl: UILabel!
    @IBOutlet weak var driveTrain: UILabel!
    @IBOutlet weak var ownersLbl: UILabel!
    @IBOutlet weak var cylinderLbl: UILabel!
    @IBOutlet weak var accidentLbl: UILabel!

//  MARK:- CollectionView
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    
//  MARK:- TextViews
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var reviewDetailsTextView: UITextView!
    
//  Mark:- Buttons
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var msgBtn: UIButton!
    @IBOutlet weak var financeThatBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var photosBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewsCollectionView.delegate = self
        reviewsCollectionView.dataSource = self
        
        mainView.layer.backgroundColor = UIColor(red: 0.961, green: 0.969, blue: 0.98, alpha: 1).cgColor
        
        messageBtn.setButtonTheme()
        setFinanceButton()
        setMsgButton()
        submitBtn.setButtonTheme()
        
        setTextView(textView: descriptionTextView)
        setTextView(textView: reviewDetailsTextView)
        
        photosBtn.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        photosBtn.layer.cornerRadius = 5
    }
    
    func setFinanceButton() {
        financeThatBtn.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        financeThatBtn.layer.cornerRadius = 20
    }
    
    func setMsgButton() {
        msgBtn.layer.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1).cgColor
        msgBtn.layer.cornerRadius = 16
    }
    
    func setTextView(textView: UITextView) {
        textView.layer.backgroundColor = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1).cgColor
        textView.layer.cornerRadius = 6
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1).cgColor
    }
    
    func setCollecView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
    
    @IBAction func photosBtn(_ sender: Any) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "ImageGalleryViewController") as! ImageGalleryViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    @IBAction func financeThatBtn(_ sender: Any) {
    }
    @IBAction func chatBtn(_ sender: Any) {
    }
    @IBAction func messageBtn(_ sender: Any) {
    }
    @IBAction func submitBtn(_ sender: Any) {
    }
    
    @IBAction func paymentCalculateBtn(_ sender: Any) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "PaymentCalculatorViewController") as! PaymentCalculatorViewController
        main.modalPresentationStyle = .overCurrentContext
        main.modalTransitionStyle = .crossDissolve
        present(main, animated: true, completion: nil)
    }
}

extension ListDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewsCollectionViewCell", for: indexPath) as! ReviewsCollectionViewCell
        setCollecView(view: cell.mainView)
        return cell
    }
}


extension ListDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 292, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
