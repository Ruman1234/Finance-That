//
//  Post4ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class Post4ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var vehicleLbl: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var yesLbl: UILabel!
    @IBOutlet weak var noLbl: UILabel!
    @IBOutlet weak var vehiclePriceLbl: UILabel!
    @IBOutlet weak var listingLbl: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var listingSourceTextField: CustomTextField!
    @IBOutlet weak var vehicleTextField: CustomTextField!
    @IBOutlet weak var vehiclePriceTextField: CustomTextField!
    
    @IBOutlet weak var noRadioBtn: UIButton!
    @IBOutlet weak var yesRadioBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var listSourceDropDownBtn: UIButton!
    @IBOutlet weak var typeOfVehicleDropDownBtn: UIButton!
    
    let dropDown = DropDown()
    let dropDown2 = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()
            
        nextBtn.setButtonTheme()
        
        dropDown.anchorView = listSourceDropDownBtn // UIView or UIBarButtonItem
        DropDown.appearance().textColor = Color.App_theme_color
        DropDown.appearance().selectedTextColor = Color.App_theme_color
        DropDown.appearance().textFont = UIFont(name: "Basis Grotesque Pro Medium", size: 15)!
        DropDown.appearance().backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 0.98, green: 0.933, blue: 0.918, alpha: 1)
        dropDown.width = self.listSourceDropDownBtn.frame.width
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Vehicle listed on Finance That", "Vehicle sold somewhere else"]
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
//            unhide()
            if index == 0 {
                self.listingSourceTextField.text = "Vehicle listed on Finance That"
                typeOfVehicleDropDownBtn.isHidden = true
                vehicleTextField.isHidden = true
                vehicleLbl.isHidden = true
                vehiclePriceLbl.isHidden = true
                vehiclePriceTextField.isHidden = true
                img2.isHidden = true
            }else if index == 1 {
                self.listingSourceTextField.text = "Vehicle sold somewhere else"
                unhide()
            }
        }
        
        
        dropDown2.anchorView = typeOfVehicleDropDownBtn // UIView or UIBarButtonItem
        DropDown.appearance().textColor = Color.App_theme_color
        DropDown.appearance().selectedTextColor = Color.App_theme_color
        DropDown.appearance().textFont = UIFont(name: "Basis Grotesque Pro Medium", size: 15)!
        DropDown.appearance().backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 0.98, green: 0.933, blue: 0.918, alpha: 1)
        dropDown2.width = self.typeOfVehicleDropDownBtn.frame.width
        // The list of items to display. Can be changed dynamically
        dropDown2.dataSource = ["Automotive", "Motorcycle", "Powersport","Boat","RV"]
        
        // Action triggered on selection
        dropDown2.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            if index == 0 {
                self.vehicleTextField.text = "Automotive"
            }else if index == 1 {
                self.vehicleTextField.text = "Motorcycle"
            }else if index == 2 {
                self.vehicleTextField.text = "Powersport"
            }else if index == 3 {
                self.vehicleTextField.text = "Boat"
            }else if index == 4 {
                self.vehicleTextField.text = "RV"
            }
        }
        
        noRadioBtn.isSelected = true
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func hide() {
        listSourceDropDownBtn.isHidden = true
        listingSourceTextField.isHidden = true
        typeOfVehicleDropDownBtn.isHidden = true
        vehicleTextField.isHidden = true
        vehicleLbl.isHidden = true
        listingLbl.isHidden = true
        vehiclePriceLbl.isHidden = true
        vehiclePriceTextField.isHidden = true
        img1.isHidden = true
        img2.isHidden = true
    }
    
    func unhide() {
        listSourceDropDownBtn.isHidden = false
        listingSourceTextField.isHidden = false
        typeOfVehicleDropDownBtn.isHidden = false
        vehicleTextField.isHidden = false
        vehicleLbl.isHidden = false
        listingLbl.isHidden = false
        vehiclePriceLbl.isHidden = false
        vehiclePriceTextField.isHidden = false
        img1.isHidden = false
        img2.isHidden = false
    }
    
    func validInput() -> Bool {
        var flag = true
        
        if !noRadioBtn.isSelected && !yesRadioBtn.isSelected{
            return false
        }
        if noRadioBtn.isSelected {
            return flag
        }
        if listingSourceTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please Select Listing Source")
            flag = false
        }
        if yesRadioBtn.isSelected && listingSourceTextField.text == "Vehicle sold somewhere else"{
            if vehicleTextField.text!.isEmpty {
                createAlert(title: nil, message: "Please enter Type of vehicle")
                flag = false
            }else if vehiclePriceTextField.text!.isEmpty {
                createAlert(title: nil, message: "Please enter Price")
                flag = false
            }
        }
        return flag
    }
    
    @IBAction func yesRadioBtn(_ sender: UIButton) {
        noRadioBtn.isSelected = false
        if yesRadioBtn.isSelected == true{
            yesRadioBtn.isSelected = false
        }else {
//            unhide()
            listSourceDropDownBtn.isHidden = false
            listingSourceTextField.isHidden = false
            listingLbl.isHidden = false
            img1.isHidden = false
            yesRadioBtn.isSelected = true
        }
    }
    
    @IBAction func noRadioBtn(_ sender: Any) {
        yesRadioBtn.isSelected = false
        if noRadioBtn.isSelected == true{
            noRadioBtn.isSelected = false
        }else {
            hide()
            noRadioBtn.isSelected = true
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if self.noRadioBtn.isSelected{
//            Set no flow post 7
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post7ViewController") as! Post7ViewController
            self.navigationController?.pushViewController(main, animated: true)

        }else if self.listingSourceTextField.text == "Vehicle listed on Finance That"{
//            push on post 10
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post10ViewController") as! Post10ViewController
            self.navigationController?.pushViewController(main, animated: true)

        }else if self.validInput(){
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post5ViewController") as! Post5ViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
    
    
    @IBAction func listSourceDropDown(_ sender: Any) {
        self.dropDown.show()
    }
    
    @IBAction func typeOfVehicleDropDown(_ sender: Any) {
        self.dropDown2.show()
    }
}
