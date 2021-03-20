//
//  Dealer6ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer6ViewController: UIViewController {

    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var VoidLbl: UILabel!
    @IBOutlet weak var voidUploadBtn: UIButton!
    @IBOutlet weak var DealershipLbl: UILabel!
    @IBOutlet weak var DealershipUploadBtn: UIButton!
    @IBOutlet weak var dealershipExteriorLbl : UILabel!
    @IBOutlet weak var dealershipExteriorbtn: UIButton!
    @IBOutlet weak var ArticleLbl: UILabel!
    @IBOutlet weak var articleUploadBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    var legalName = ""
    var operatingName = ""

    var streetAddress = ""
    var city = ""
    var province = ""
    var postalCode = ""
    var emailAddress = ""
    var telephone = ""
    var fax = ""

    let vc = UIImagePickerController()
    
    var image1 : UIImage = UIImage()
    var image1Check : Bool = false
    var image2 : UIImage = UIImage()
    var image2Check : Bool = false
    var image3 : UIImage = UIImage()
    var image3Check : Bool = false
    var image4 : UIImage = UIImage()
    var image4Check : Bool = false


    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        VoidLbl.textColor = Color.App_theme_color
        DealershipLbl.textColor = Color.App_theme_color
        dealershipExteriorLbl.textColor = Color.App_theme_color
        ArticleLbl.textColor = Color.App_theme_color
        
        nextBtn.setButtonTheme()
        
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        
        self.design(btn: previousBtn)
        self.upload(btn: voidUploadBtn)
        self.upload(btn: DealershipUploadBtn)
        self.upload(btn: dealershipExteriorbtn)
        self.upload(btn: articleUploadBtn)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func design(btn :UIButton)  {
        btn.layer.backgroundColor = UIColor.white.cgColor
        
        btn.layer.borderWidth = 1
        btn.setButtonTheme()
    }
    
    func upload(btn :UIButton)  {
          btn.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
          btn.layer.cornerRadius = 5
          btn.layer.borderWidth = 1
          btn.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.933, alpha: 1).cgColor
          btn.setTitleColor(Color.App_theme_color, for: .normal)
      }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer7ViewController") as! Dealer7ViewController
        main.image1 = self.image1
        main.image2 = self.image2
        main.image3 = self.image3
        main.image4 = self.image4
        
        main.business_name = self.legalName
        main.operating_name = self.operatingName
        main.full_name = self.legalName
        main.street_address = self.streetAddress
        main.email = self.emailAddress
        main.province = self.province
        main.city = self.city
        main.postal_code = self.postalCode
        main.phone = self.telephone
        main.fax = self.fax
        main.email = self.emailAddress
        self.navigationController?.pushViewController(main, animated: true)

    }
    
    @IBAction func voidChequeBtn(_ sender: Any) {
        image1Check = true
        present(vc, animated: true)
    }
    
    @IBAction func dealershipInteriorBtn(_ sender: Any) {
        image2Check = true
        present(vc, animated: true)
    }
    
    @IBAction func dealershipExteriorBtn(_ sender: Any) {
        image3Check = true
        present(vc, animated: true)
    }
    
    @IBAction func articleBtn(_ sender: Any) {
        image4Check = true
        present(vc, animated: true)
    }
}

extension Dealer6ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            if image1Check {
                image1 = image
                self.img1.image = UIImage(named: "Tick")
            }else if image2Check{
                image2 = image
                self.img2.image = UIImage(named: "Tick")

            }else if image3Check{
                image3 = image
                self.img3.image = UIImage(named: "Tick")

            }else if image4Check{
                image4 = image
                self.img4.image = UIImage(named: "Tick")
            }
        }
        image1Check = false
        image2Check = false
        image3Check = false
        image4Check = false
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
