//
//  SearchScreenViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 26/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SearchScreenViewController: UIViewController {

    @IBOutlet weak var carsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carsTableView.delegate = self
    }

}

extension SearchScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
            let carCell = tableView.dequeueReusableCell(withIdentifier: "carNameCell", for: indexPath) as! CarNamesTableViewCell
                  
            return cell

        }else if indexPath.row == 1{
            
            let recentSearchcell = tableView.dequeueReusableCell(withIdentifier: "recentSearchcell", for: indexPath) as! RecentSearchTableViewCell
            cell.collectionView.tag = indexPath.row
           
            return cell

        }else if indexPath.row == 2{
        
        let carDetailcell = tableView.dequeueReusableCell(withIdentifier: "carDetail", for: indexPath) as! CarDetailTableViewCell
            cell.collectionView2.tag = indexPath.row
            return cell

        }else{
            return UITableViewCell()
        }
    }
}
        

