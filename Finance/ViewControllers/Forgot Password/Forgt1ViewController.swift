//
//  Forgt1ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 26/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Forgt1ViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forgotLbl: UILabel!
    @IBOutlet weak var pleaseLbl: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotLbl.textColor = Color.App_theme_color
        pleaseLbl.textColor = Color.App_theme_color
        lbl3.textColor = Color.gray_theme_color
        emailLbl.textColor = Color.App_theme_color
        
        nextBtn.setButtonTheme()
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }

    func validInput() -> Bool {
        var flag = true
        if emailTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter email")
            flag = false
        }
        return flag
    }
    
    func reset() {
        NetworkManager.SharedInstance.ResetPassword(email: emailTextField.text ?? "", viewcontroller: self) { (res) in
            if res.success == true {
                let main = self.storyboard?.instantiateViewController(withIdentifier: "Forgot2ViewController") as! Forgot2ViewController
                self.navigationController?.pushViewController(main, animated: true)
            }
        } failure: { (err) in
            print("Failed")
        }
    }
    
    
    
    func restEmail() {
        var dict = Dictionary<String, Any>()

            dict = ["email": emailTextField.text ?? "", "redirect_url": "http://24.227.130.19/"]
            var  jsonData = NSData()

           // var dataString2 :String = ""
            do {
                 jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData
                // you can now cast it with the right type
            } catch {
                print(error.localizedDescription)
            }

            print(jsonData)
            let url:URL = URL(string: "http://24.227.130.19:8000/request-reset-email/")!
            let session = URLSession.shared


            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("\(jsonData.length)", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData as Data

            let task = session.dataTask(with: request as URLRequest) {
                (
                data, response, error) in
                guard let data = data, let _:URLResponse = response, error == nil else {
                    print("error")
                    return
                }
                let dataString =  String(data: data, encoding: String.Encoding.utf8)
                print("no data",dataString ?? "no data")
            }
            task.resume()
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        if self.validInput() {
            reset()
//            restEmail()
        }
    }
    
}
