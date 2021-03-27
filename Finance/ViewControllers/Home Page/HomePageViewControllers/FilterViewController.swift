//
//  FilterViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 25/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet weak var allCategoriesTableView: UITableView!
    @IBOutlet weak var categoriesTableView: UITableView!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var categoriesArray = [DataArray]()
    let allCategoriesArr = ["All Categories","Year","Make","Model","Price","Color","Trim","KM","Condition","Transmission","Body Type","Seatings","Fuel Type","Drive Train","Cylinder","Exterior Color","Owners","Accidents"]
    
    let categoriesArr = ["Automobiles","ATV/UTVs","Condos","Motorcycles","Boats","Watercrafts","RVs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesArray = [DataArray(section: "Categories", rows: ["1"])]
        
        allCategoriesTableView.delegate = self
        allCategoriesTableView.dataSource = self
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
        
    }
}

extension FilterViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == categoriesTableView {
            return categoriesArray.count
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == categoriesTableView {
            let header = UIView(frame: CGRect(x: 24, y: 0, width: self.categoriesTableView.frame.size.width, height: 58))
            header.backgroundColor = .white
            
            let label = UILabel(frame: header.frame)
            label.text = categoriesArray[section].section
            label.textAlignment = .left
            label.font = UIFont(name: "Basis Grotesque Pro Medium", size: 13)
            label.textColor = Color.App_theme_color
            header.addSubview(label)
            return header
        }
        
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == categoriesTableView {
            return 58
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == categoriesTableView {
            return 320
        }
        return 58
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == allCategoriesTableView {
            return allCategoriesArr.count
        }
        return categoriesArray[section].rows.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == allCategoriesTableView {
            let allCategories = tableView.dequeueReusableCell(withIdentifier: "allCategoriesCell", for: indexPath) as! AllCategoriesCell
            allCategories.allCategoriesLbl.text = allCategoriesArr[indexPath.row]
            return allCategories
        }else {
//            let sliderCell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as! RangeSliderTableViewCell
//            return sliderCell
//            if indexPath.section == 0{
//                let categoriesCell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell", for: indexPath) as! CategoriesTableViewCell
//              categoriesCell.lbl.text = categoriesArray[indexPath.section].rows[indexPath.row]
//               return categoriesCell
//            }
//           if indexPath.section == 1{
               let sliderCell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as! RangeSliderTableViewCell
                return sliderCell
//            }
           return UITableViewCell()
        }
    }
}


struct DataArray {
    var section :String
    var rows    :[String]
}
