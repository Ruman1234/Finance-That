//
//  ReportProblemViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class ReportProblemViewController: UIViewController {

    @IBOutlet weak var selectOneTextField: CustomTextField!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var submitBtn: UIButton!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextView(textView: detailsTextView)
        setGraySubmitBtn()
        detailsTextView.delegate = self
        
        dropDown.anchorView = selectOneTextField // UIView or UIBarButtonItem

        dropDown.width = 400
                // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Select one","Inaccurate review","Offensive language","Fake review"]
                
                // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    
                    if index == 0 {
                        print("hi")
                    }else if index == 1 {
                        self.selectOneTextField.text = "Inaccurate review"
                        submitBtn.setButtonTheme()
                    }else if index == 2 {
                        self.selectOneTextField.text = "Offensive language"
                        submitBtn.setButtonTheme()
                    }else if index == 3 {
                        self.selectOneTextField.text = "Fake review"
                        submitBtn.setButtonTheme()
                    }
        }
    }
    
    func setTextView(textView: UITextView) {
        textView.layer.backgroundColor = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1).cgColor
        textView.textColor = Color.gray_theme_color
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1).cgColor
    }
    
    func setGraySubmitBtn() {
        submitBtn.layer.backgroundColor = UIColor(red: 0.667, green: 0.671, blue: 0.678, alpha: 1).cgColor
        submitBtn.layer.cornerRadius = 20
    }
    
    @IBAction func crossBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectOneBtn(_ sender: Any) {
        self.dropDown.show()
    }
    
    @IBAction func submitBtn(_ sender: Any) {
    }
    
    
}

extension ReportProblemViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if detailsTextView.textColor == Color.gray_theme_color {
            detailsTextView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            detailsTextView.text = ""
            detailsTextView.layer.cornerRadius = 5
            detailsTextView.layer.borderWidth = 1
            detailsTextView.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1).cgColor
            submitBtn.setButtonTheme()
        }
     }
    
     func textViewDidEndEditing(_ textView: UITextView) {
         if detailsTextView.text.isEmpty {
             detailsTextView.text = "Write here"
            detailsTextView.textColor = Color.gray_theme_color
            detailsTextView.layer.backgroundColor = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1).cgColor
            setGraySubmitBtn()
         }
     }
}
