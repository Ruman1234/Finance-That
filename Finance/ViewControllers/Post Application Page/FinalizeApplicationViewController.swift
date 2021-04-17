//
//  FinalizeApplicationViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 16/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class FinalizeApplicationViewController: UIViewController {

    @IBOutlet weak var scrolller: UIScrollView!
    
    //  Mark:- Views
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
//  Mark:- Buttons
    @IBOutlet weak var ApplicantInfoEditBtn: UIButton!
    @IBOutlet weak var AddressEditBtn: UIButton!
    @IBOutlet weak var employmentEditBtn: UIButton!
    @IBOutlet weak var vehicleInfoEditBtn: UIButton!
    @IBOutlet weak var sellerInfoEditBtn: UIButton!
    @IBOutlet weak var coApplicantBtn: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var discardBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if PostApplicaitonObject.coAppObject.isEmpty {
            view6.isHidden = true
        }
        
        if PostApplicaitonObject.vehicle.isEmpty {
            view4.isHidden = true
        }
        if PostApplicaitonObject.seller.isEmpty {
            view5.isHidden = true
        }
        print(PostApplicaitonObject.mainObject)
        applyBtn.setButtonTheme()
        
        setView(view: view1)
        setView(view: view2)
        setView(view: view3)
        setView(view: view4)
        setView(view: view5)
        setView(view: view6)

        setEditBtn(button: ApplicantInfoEditBtn)
        setEditBtn(button: AddressEditBtn)
        setEditBtn(button: employmentEditBtn)
        setEditBtn(button: vehicleInfoEditBtn)
        setEditBtn(button: sellerInfoEditBtn)
        setEditBtn(button: coApplicantBtn)

    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        scrolller.isScrollEnabled = true
        scrolller.contentSize = CGSize(width: self.view.frame.width, height: 682)
    }

    func setView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
    
    func setEditBtn(button: UIButton) {
        button.layer.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.961, alpha: 1).cgColor
        button.layer.cornerRadius = 5
    }
    
    @IBAction func crossBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated:true )
    }
    
    @IBAction func applicantInfoEditBtn(_ sender: Any) {
        self.navigationController?.popBack(toControllerType: Post1ViewController.self)
    }
    
    @IBAction func addressEditBtn(_ sender: Any) {
        self.navigationController?.popBack(toControllerType: Post2ViewController.self)
    }
    
    @IBAction func employmentEditBtn(_ sender: Any) {
        self.navigationController?.popBack(toControllerType: Post3ViewController.self)
    }
    
    @IBAction func vehicleInfoEditBtn(_ sender: Any) {
        self.navigationController?.popBack(toControllerType: Post5ViewController.self)
    }
    
    @IBAction func sellerInfoEditBtn(_ sender: Any) {
        self.navigationController?.popBack(toControllerType: Post6ViewController.self)
    }
    
    @IBAction func coApplicatnInfoEditBtn(_ sender: Any) {
        self.navigationController?.popBack(toControllerType: Post3ViewController.self)
    }
    
    @IBAction func applyBtn(_ sender: Any) {
        ApplyLoan()
    }
    
    func ApplyLoan()  {
        PostApplicaitonObject.mainObject["user"] = defaults.userID
        PostApplicaitonObject.mainObject["application_status"] = "Pending"
        PostApplicaitonObject.mainObject["sin"] = "0"
        let emptyDictionary = NSDictionary()

        if PostApplicaitonObject.coAppObject.isEmpty {
            PostApplicaitonObject.mainObject["co_applicant"] = emptyDictionary
        }
        if PostApplicaitonObject.seller.isEmpty {
            PostApplicaitonObject.mainObject["seller"] = emptyDictionary
        }
        if PostApplicaitonObject.vehicle.isEmpty{
            PostApplicaitonObject.mainObject["vehicle"] = emptyDictionary
        }
        
        NetworkManager.SharedInstance.PostApplication(parm: PostApplicaitonObject.mainObject) { (res) in
            print(res)
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post8ViewController") as! Post8ViewController
            self.navigationController?.pushViewController(main, animated: true)
            PostApplicaitonObject.removeAll()
        } failure: { (err) in
//            print("err.debugDescription")
            Utilities.ShowAlert(title: "Alert!!!", message: "Something went wrong", view: self)
        }

    }
    @IBAction func discardBtn(_ sender: Any) {
        PostApplicaitonObject.removeAll()
        self.navigationController?.popBack(toControllerType: Post1ViewController.self)
    }
}

extension UINavigationController {
    
    func popBack(_ nb: Int) {
        let viewControllers: [UIViewController] = self.viewControllers
        guard viewControllers.count < nb else {
            self.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
            return
        }
    }
    
    /// pop back to specific viewcontroller
    func popBack<T: UIViewController>(toControllerType: T.Type) {
        var viewControllers: [UIViewController] = self.viewControllers
        viewControllers = viewControllers.reversed()
        for currentViewController in viewControllers {
            if currentViewController .isKind(of: toControllerType) {
                self.popToViewController(currentViewController, animated: true)
                break
            }
        }
    }
    
}
