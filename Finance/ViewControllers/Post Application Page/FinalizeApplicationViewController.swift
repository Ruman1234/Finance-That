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
  
//  Mark:- Buttons
    @IBOutlet weak var ApplicantInfoEditBtn: UIButton!
    @IBOutlet weak var AddressEditBtn: UIButton!
    @IBOutlet weak var employmentEditBtn: UIButton!
    @IBOutlet weak var vehicleInfoEditBtn: UIButton!
    @IBOutlet weak var sellerInfoEditBtn: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var discardBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(PostApplicaitonObject.mainObject)
        applyBtn.setButtonTheme()
        
        setView(view: view1)
        setView(view: view2)
        setView(view: view3)
        setView(view: view4)
        setView(view: view5)
        
        setEditBtn(button: ApplicantInfoEditBtn)
        setEditBtn(button: AddressEditBtn)
        setEditBtn(button: employmentEditBtn)
        setEditBtn(button: vehicleInfoEditBtn)
        setEditBtn(button: sellerInfoEditBtn)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
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
        self.navigationController?.popBack(9)
    }
    
    @IBAction func addressEditBtn(_ sender: Any) {
        self.navigationController?.popBack(8)
    }
    
    @IBAction func employmentEditBtn(_ sender: Any) {
        self.navigationController?.popBack(6)
    }
    
    @IBAction func vehicleInfoEditBtn(_ sender: Any) {
        self.navigationController?.popBack(5)
    }
    
    @IBAction func sellerInfoEditBtn(_ sender: Any) {
        self.navigationController?.popBack(5)
    }
    
    @IBAction func applyBtn(_ sender: Any) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post8ViewController") as! Post8ViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    
    @IBAction func discardBtn(_ sender: Any) {
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
