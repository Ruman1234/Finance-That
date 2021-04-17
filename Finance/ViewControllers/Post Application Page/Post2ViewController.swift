//
//  Post2ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

class Post2ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var houseLbl: UILabel!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var provinceLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var houseTextField: CustomTextField!
    @IBOutlet weak var streetTextField: CustomTextField!
    @IBOutlet weak var cityTextField: CustomTextField!
    @IBOutlet weak var provinceTextField: CustomTextField!
    @IBOutlet weak var postalcodeTextField: CustomTextField!
    @IBOutlet weak var countryTextField: CustomTextField!
    
    
    
    var placeIDArray = [String]()
    var resultsArray = [String]()
    var primaryAddressArray = [String]()
    var searchResults = [String]()
    var searhPlacesName = [String]()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        houseLbl.textColor = Color.App_theme_color
        streetLbl.textColor = Color.App_theme_color
        cityLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color
        durationLbl.textColor = Color.App_theme_color
        statusLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color
        setupTableView()
        nextBtn.setButtonTheme()
        houseTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 820)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func validInput() -> Bool {
        var flag = true
        if houseTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter First Name")
            flag = false
        }else if streetTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Last Name")
            flag = false
        }else if cityTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Date")
            flag = false
        }else if provinceTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Telephone Number")
            flag = false
        }else if postalcodeTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Telephone Number")
            flag = false
        }else if countryTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Telephone Number")
            flag = false
        }
        return flag
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
        if self.validInput(){
            let main = self.storyboard?.instantiateViewController(withIdentifier: "DurationAddressViewController") as! DurationAddressViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
    
    func setData(dict:inout [String : Any]) {
        dict["address"]         = self.houseTextField.text  ?? ""
        dict["street_address"]  = self.streetTextField.text   ?? ""
        dict["city"]            = self.cityTextField.text       ?? ""
        dict["province"]        = self.provinceTextField.text   ?? ""
        dict["postal_code"]     = self.postalcodeTextField.text   ?? ""
        dict["country"]         = self.countryTextField.text   ?? ""
    }
    
    func hideTableViewWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        self.mainView.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func dismissTableView() {
        view.endEditing(true)
        tableView.isHidden = true
    }
    
    
    func setupTableView() {
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        mainView.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // tableView.frame = CGRect(x: 21, y: y, width: self.shipmentAdsres.frame.width, height: 300)
        
        tableView.frame = CGRect(x: 21, y: 300, width: self.houseTextField.frame.width, height: 300)
        
        // self.tableView.isHidden = true
    }
   
}

extension Post2ViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.placeAutocomplete(text_input: houseTextField.text ?? "")
        self.tableView.isHidden = false
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.houseTextField {
            self.tableView.isHidden = true
        }
    }
}

extension Post2ViewController{
    func latLong(lat: Double,long: Double) {
        
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: lat , longitude: long)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            print("Response GeoLocation : \(placemarks)")
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            // Country
            #if DEBUG
            print(placeMark?.country)
            print(placeMark.administrativeArea)
            print(placeMark?.locality)
            print(placeMark?.subLocality)
            print(placeMark?.thoroughfare)
            print(placeMark?.postalCode)
            print(placeMark?.subThoroughfare)
            #endif
            self.countryTextField.text = placeMark?.country ?? ""
            self.provinceTextField.text = placeMark?.administrativeArea ?? ""
            self.cityTextField.text = placeMark?.locality ?? ""
            self.postalcodeTextField.text = placeMark?.postalCode ?? ""
            self.streetTextField.text = placeMark?.thoroughfare ?? ""
        })
    }
    
    
    func placeAutocomplete(text_input: String) {
        let placesClient = GMSPlacesClient()
        let filter = GMSAutocompleteFilter()
        
        filter.type = .establishment
        
        
        //geo bounds set for karntaka region
        let bounds = GMSCoordinateBounds(coordinate: CLLocationCoordinate2D(latitude: 32.7767, longitude: 96.7970), coordinate: CLLocationCoordinate2D(latitude: 33.7490, longitude: 84.3880))
        
        placesClient.autocompleteQuery(text_input, bounds: bounds, filter: nil) { (results, error) -> Void in
            self.placeIDArray.removeAll()
            self.resultsArray.removeAll()
            self.primaryAddressArray.removeAll()
            if let error = error {
                print("Autocomplete error \(error)")
                return
            }
            
            if let results = results {
                for result in results {
                    
                    print(result.types)
                    
                    self.primaryAddressArray.append(result.attributedPrimaryText.string)
                    
                    self.resultsArray.append(result.attributedFullText.string)
                    self.primaryAddressArray.append(result.attributedPrimaryText.string)
                    self.placeIDArray.append(result.placeID)
                    
                }
            }
            
            
            self.searchResults = self.resultsArray
            self.searhPlacesName = self.primaryAddressArray
            self.tableView.reloadData()
        }
    }
}
extension Post2ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.searchResults.count)
        return self.searchResults.count
        // print(self.searchSource?.count)
        // return searchSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // cell.textLabel?.text = self.searchSource![indexPath.row]
        
        cell.textLabel?.text = self.searchResults[indexPath.row]
        
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.shipmentAdsres.text = self.searchSource![indexPath.row]
        self.tableView.isHidden = true
        // let address = self.searchSource![indexPath.row]
        
        
        
        let address = self.searchResults[indexPath.row]
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
            
            else {
                // handle no location found
                return
            }
            
            self.latLong(lat: location.coordinate.latitude, long: location.coordinate.longitude)
            
        }
        
    }
    
    
    
}
