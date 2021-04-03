//
//  PaymentMethodViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 03/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class PaymentMethodViewController: UIViewController {

    @IBOutlet weak var payPalBtn: UIButton!
    @IBOutlet weak var creditCardBtn: UIButton!
    @IBOutlet weak var addCardBtn: UIButton!
    
    @IBOutlet weak var radioImgPaypal: UIImageView!
    @IBOutlet weak var radioImgCreditCrd: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtn(button: payPalBtn)
        setBtn(button: creditCardBtn)
        setBtn(button: addCardBtn)
    }
    
    func setBtn(button: UIButton) {
        button.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
    }
    
    @IBAction func payPalBtn(_ sender: UIButton) {
        if sender.isSelected == true {
            radioImgPaypal.image = UIImage(named: "WhiteCircle")
            sender.isSelected = false
        }else {
            radioImgPaypal.image = UIImage(named: "OrangeCircle")
            sender.isSelected = true
        }
    }
    @IBAction func creditCrdBtn(_ sender: UIButton) {
        if sender.isSelected == true {
            radioImgCreditCrd.image = UIImage(named: "WhiteCircle")
            sender.isSelected = false
        }else {
            radioImgCreditCrd.image = UIImage(named: "OrangeCircle")
            sender.isSelected = true
        }
    }
    @IBAction func addCardBtn(_ sender: Any) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "PayWithViewController") as! PayWithViewController
        main.modalPresentationStyle = .overCurrentContext
        main.modalTransitionStyle = .crossDissolve
        present(main, animated: true, completion: nil)
    }
}
