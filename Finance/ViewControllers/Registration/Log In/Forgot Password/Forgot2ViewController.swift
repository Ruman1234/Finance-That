//
//  Forgot2ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 26/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Forgot2ViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forgotLbl: UILabel!
    @IBOutlet weak var pleaseLbl: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var codeLbl: UILabel!
    @IBOutlet weak var codeTextField: OneTimeCodeTextField!
    @IBOutlet weak var didntLbl: UILabel!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    
//    let alert = AlertService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        codeTextField.didEnterLastDigit = { [weak self] code in
//            print(code)
//            guard let alert = self?.alert.successMessage(with: code) else {return}
//            self.present(alert, animated: true)
//        }
        
        forgotLbl.textColor = Color.App_theme_color
        pleaseLbl.textColor = Color.App_theme_color
        lbl3.textColor = Color.App_theme_color
        codeLbl.textColor = Color.App_theme_color
        didntLbl.textColor = Color.gray_theme_color
        resendBtn.setTitleColor(Color.red_theme_color, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resendBtn(_ sender: Any) {
    }
    
    @IBAction func continueBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Forgot3ViewController") as! Forgot3ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
}
