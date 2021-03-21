//
//  Dealer7ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer7ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var readLbl: UILabel!
    @IBOutlet weak var ifYouNeedlbl: UILabel!
    @IBOutlet weak var radioBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    var image1 : UIImage?
    var image2 : UIImage?
    var image3 : UIImage?
    var image4 : UIImage?
    
    var imageArray = [imageData]()
    
    var user_type = String()
    var business_name = String()
    var operating_name = String()
    var street_address = String()
    var city = String()
    var province = String()
    var postal_code = String()
    var phone = String()
    var fax = String()
    var full_name = String()
    var password = String()
    var email = String()
    var owner = String()
    var years_in_business = String()
    var no_of_owner = String()
    var utillityBillDoc = String()
    var dealerAgreement = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        readLbl.textColor = Color.App_theme_color
        ifYouNeedlbl.textColor = Color.App_theme_color
        
        submitBtn.setButtonTheme()

        self.design(btn: previousBtn)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }

    func design(btn :UIButton)  {
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 19
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.red_theme_color.cgColor
        btn.setTitleColor(Color.red_theme_color, for: .normal)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func radioBtn(_ sender: Any) {
        
        if radioBtn.isSelected == true{
            radioBtn.isSelected = false
        }else if radioBtn.isSelected == false {
            radioBtn.isSelected = true
        }
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    func dealerDetails() {
        
        self.imageArray = [imageData(name: "void_check_path", image: image1),
        imageData(name: "interior_business_path", image: image2),
        imageData(name: "exterior_business_path", image: image3),
        imageData(name: "license_path", image: image4)]
        
        let param = ["user_type" : "2","business_name": business_name,"operating_name": operating_name,"street_address": street_address,"city": city,"province": province,"postal_code": postal_code,"phone": phone,"fax": fax,"full_name": full_name,"password": password,"email": email,"owner": owner,"years_in_business": years_in_business,"no_of_owner": no_of_owner,"utillityBillDoc": utillityBillDoc,"dealerAgreement": dealerAgreement]
        print(param)
        
        NetworkManager.SharedInstance.DealerDetails(images: imageArray, params: param, viewcontroller: self) { (res) in
            print(param)
            
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer8ViewController") as! Dealer8ViewController
            self.navigationController?.pushViewController(main, animated: true)

            
        } failure: { (err) in
            print("Failed")
        }

        
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        
        if radioBtn.isSelected == true {
            dealerDetails()
        }else{
            createAlert(title: nil, message: "Please read and accept Dealer Agreement")
        }
    }
}

struct imageData {
    let name : String
    let image : UIImage?
}
