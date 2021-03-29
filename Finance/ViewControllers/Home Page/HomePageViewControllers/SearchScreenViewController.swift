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
        carsTableView.dataSource = self
        carsTableView.estimatedRowHeight = 720
    }

}

extension SearchScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
            let carCell = tableView.dequeueReusableCell(withIdentifier: "carNameCell", for: indexPath) as! CarNamesTableViewCell
            carCell.carNamesCollectionView.tag = indexPath.row
            return carCell

        }else if indexPath.row < 5{
            
            let recentSearchcell = tableView.dequeueReusableCell(withIdentifier: "recentSearchCell", for: indexPath) as! RecentSearchTableViewCell
            
            return recentSearchcell

        }else if indexPath.row == 5{
        
            let carDetailcell = tableView.dequeueReusableCell(withIdentifier: "carDetail", for: indexPath) as! CarDetailTableViewCell
            
            let height = carDetailcell.carInfoCollectionView.collectionViewLayout.collectionViewContentSize.height
            carDetailcell.collectionViewHeight.constant = height
            carDetailcell.carInfoCollectionView.layoutIfNeeded()
            
            carDetailcell.carInfoCollectionView.tag = indexPath.row
            
            return carDetailcell

        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
        
