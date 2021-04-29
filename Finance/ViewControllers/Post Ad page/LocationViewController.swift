//
//  LocationViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 03/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

class LocationViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var locationTextField: CustomTextField!
    
    var placeIDArray = [String]()
    var resultsArray = [String]()
    var primaryAddressArray = [String]()
    var searchResults = [String]()
    var searhPlacesName = [String]()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        locationTextField.delegate = self
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.blue.cgColor
    }
    
}

extension LocationViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.placeAutocomplete(text_input: locationTextField.text ?? "")
        self.tableView.isHidden = false
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.locationTextField {
            self.tableView.isHidden = true
        }
    }
}


extension LocationViewController{
    func setupTableView() {
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // tableView.frame = CGRect(x: 21, y: y, width: self.shipmentAdsres.frame.width, height: 300)
        
        tableView.frame = CGRect(x: 21, y: 300, width: self.locationTextField.frame.width, height: 300)
        
        // self.tableView.isHidden = true
    }
    
    
    func hideTableViewWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func dismissTableView() {
        view.endEditing(true)
        tableView.isHidden = true
    }
    
}
extension LocationViewController{
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
            self.locationTextField.text = placeMark?.country ?? ""
            
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
extension LocationViewController:UITableViewDelegate, UITableViewDataSource {
    
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
