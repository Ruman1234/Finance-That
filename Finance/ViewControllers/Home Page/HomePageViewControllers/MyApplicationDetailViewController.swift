//
//  MyApplicationDetailViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 22/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class MyApplicationDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var applicationLbl: UILabel!
    @IBOutlet weak var applicationIdView: UIView!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var gmailLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var viewBtn: UIButton!
    
    @IBOutlet weak var financingView: UIView!
    @IBOutlet weak var approvedLbl: UILabel!
    @IBOutlet weak var amorizationLbl: UILabel!
    @IBOutlet weak var approvedPrice: UILabel!
    @IBOutlet weak var amorizationMonthLbl: UILabel!
    @IBOutlet weak var downPaymentLbl: UILabel!
    @IBOutlet weak var downPriceLbl: UILabel!
    @IBOutlet weak var interestLbl: UILabel!
    @IBOutlet weak var interestRatioLbl: UILabel!
    @IBOutlet weak var paymentsLbl: UILabel!
    @IBOutlet weak var paymentsPriceLbl: UILabel!
    @IBOutlet weak var thirdVehicleLbl: UILabel!
    @IBOutlet weak var typeOfVehicleLbl: UILabel!
    @IBOutlet weak var typeOfVehicleTextField: UITextField!
    @IBOutlet weak var vehicleMakeLbl: UILabel!
    @IBOutlet weak var vehicleMakeTextField: UITextField!
    @IBOutlet weak var vehicleYearLbl: UILabel!
    @IBOutlet weak var vehicleYearTextfield: UITextField!
    @IBOutlet weak var Kilometers: UILabel!
    @IBOutlet weak var kilometersTextField: UITextField!
    @IBOutlet weak var priceTFLbl: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var conditionTextField: UITextField!
    @IBOutlet weak var viewThirdPartyBtn: UIButton!
    
    @IBOutlet weak var financeVehicleLbl: UILabel!
    @IBOutlet weak var financeStockLbl: UILabel!
    @IBOutlet weak var stockTextField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var stockFoundLbl: UILabel!
    
    @IBOutlet weak var stockFoundView: UIView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var attachBtn: UIButton!
    @IBOutlet weak var thirdPartySellerLbl: UILabel!
    @IBOutlet weak var sellerNameLbl: UILabel!
    @IBOutlet weak var sellerTextField: UITextField!
    @IBOutlet weak var dealershipNameLbl: UILabel!
    @IBOutlet weak var dealershipTextfield: UITextField!
    @IBOutlet weak var emailAddressLbl: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telephone1Lbl: UILabel!
    @IBOutlet weak var telephone1TextField: UITextField!
    @IBOutlet weak var telePhone2TextField: UITextField!
    @IBOutlet weak var telephone2Lbl: UILabel!
    @IBOutlet weak var faxNumberLbl: UILabel!
    @IBOutlet weak var faxNumberTextField: UITextField!
    @IBOutlet weak var streetAddressLbl: UILabel!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var provinceLbl: UILabel!
    @IBOutlet weak var provinceTextField: UITextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var postalCodeLbl: UILabel!
    @IBOutlet weak var postalCodeTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var financeSellerView: UIView!
    @IBOutlet weak var financeSellerLbl: UILabel!
    @IBOutlet weak var financesellerNameLbl: UILabel!
    @IBOutlet weak var dealerNameLbl: UILabel!
    @IBOutlet weak var dealerIncLbl: UILabel!
    @IBOutlet weak var finnceEmailLbl: UILabel!
    @IBOutlet weak var financeemailAddressLbl: UILabel!
    @IBOutlet weak var financeTelephoneLbl: UILabel!
    @IBOutlet weak var TelephonenumberLbl: UILabel!
    @IBOutlet weak var financePostal: UILabel!
    @IBOutlet weak var financePostalCodeLbl: UILabel!
    @IBOutlet weak var financeCityLbl: UILabel!
    @IBOutlet weak var bramptomLbl: UILabel!
    @IBOutlet weak var financepostalcode2: UILabel!
    @IBOutlet weak var financePostalCodeLbl2: UILabel!
    
    @IBOutlet weak var documentsLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var documentUpload: UILabel!
    @IBOutlet weak var selectDocumentBtn: UIButton!
    @IBOutlet weak var chooseFileBtn: UIButton!
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var applicationDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.redDesign(btn: viewBtn)
        self.redDesign(btn: viewThirdPartyBtn)
        self.redDesign(btn: searchBtn)
        self.redDesign(btn: saveBtn)
        self.redDesign(btn: uploadBtn)
        self.selectDocumentTypeBtn(btn: selectDocumentBtn)
        self.attachButton(btn: attachBtn)
        
        applicationDetailTableView.delegate = self
        applicationDetailTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 3485)
    }

    
    func redDesign(btn :UIButton)  {
        btn.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
    }
    
    func selectDocumentTypeBtn(btn :UIButton)  {
        btn.setTitleColor(UIColor(red: 0.537, green: 0.475, blue: 0.6, alpha: 1), for: .normal)
//        btn.layer.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
    
    func attachButton(btn :UIButton) {
        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.layer.backgroundColor = UIColor(red: 0.506, green: 0.858, blue: 0.057, alpha: 1).cgColor
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red: 0.506, green: 0.858, blue: 0.057, alpha: 1).cgColor
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! ApplicationDetailTableViewCell
        return cell
    }
    
}
