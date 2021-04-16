//
//  Post1ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 06/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post1ViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var firstNamelbl: UILabel!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var lastnameTextField: CustomTextField!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var dateTextField: CustomTextField!
    
    @IBOutlet weak var telephoneTxtField: CustomTextField!
    //    @IBOutlet weak var opplicantLbl: UILabel!
//    @IBOutlet weak var yesRadioBtn: UIButton!
//    @IBOutlet weak var noRadioBtn: UIButton!
//    @IBOutlet weak var yesLbl: UILabel!
//    @IBOutlet weak var noLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        firstNamelbl.textColor = Color.App_theme_color
        lastNameLbl.textColor = Color.App_theme_color
        dateLbl.textColor = Color.App_theme_color
        
        nextBtn.setButtonTheme()
        
        showDatePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if PostApplicaitonObject.IsCoApplicant{
            self.setData(dict: &PostApplicaitonObject.coAppObject)
        }else{
            self.setData(dict: &PostApplicaitonObject.mainObject)
        }
        print(PostApplicaitonObject.mainObject)
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post2ViewController") as! Post2ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
    func setData(dict:inout [String : Any]) {
        dict["first_name"]  = self.firstNameTextField.text  ?? ""
        dict["last_name"]   = self.lastnameTextField.text   ?? ""
        dict["dob"]         = self.dateTextField.text       ?? ""
        dict["telephone"]   = self.telephoneTxtField.text   ?? ""
    }
    
}

extension Post1ViewController {
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date

       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker

     }

      @objc func donedatePicker(){

       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
     }

     @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
}
