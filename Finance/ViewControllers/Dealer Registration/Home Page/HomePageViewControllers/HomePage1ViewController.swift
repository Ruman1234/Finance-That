//
//  HomePage1ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 16/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class HomePage1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var homePageTableView: UITableView!
    
    var maskimage = [UIImage(named: "MaskGroup")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePageTableView.estimatedRowHeight = 720
        setupTableViewCells()

    }
    
    func setupTableViewCells()  {
        let HomeBuySellExploreCellXib = UINib(nibName: "HomeBuySellExploreCell", bundle: nil)
        homePageTableView.register(HomeBuySellExploreCellXib, forCellReuseIdentifier: "homecell")
        
        
        let FeaturedCellCellXib = UINib(nibName: "FeaturedCell", bundle: nil)
        homePageTableView.register(FeaturedCellCellXib, forCellReuseIdentifier: "featureCell")
        
        let SearchByTypeCellXib = UINib(nibName: "SearchByTypeTableViewCell", bundle: nil)
        homePageTableView.register(SearchByTypeCellXib, forCellReuseIdentifier: "searchCollecCell")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let homecell = tableView.dequeueReusableCell(withIdentifier: "homecell", for: indexPath) as! HomeBuySellExploreCell
            homecell.mainImg.image = maskimage[indexPath.row]
            return homecell
        }else if indexPath.row == 1 {
            let Featuredcell = tableView.dequeueReusableCell(withIdentifier: "featureCell", for: indexPath) as! FeaturedCell
            let height = Featuredcell.collectionView.collectionViewLayout.collectionViewContentSize.height
            Featuredcell.collectionViewHeight.constant = height
            Featuredcell.collectionView.layoutIfNeeded()
            return Featuredcell
        }else if indexPath.row == 2 {
            let SearchCell = tableView.dequeueReusableCell(withIdentifier: "searchCollecCell", for: indexPath) as! SearchByTypeTableViewCell
            let height = SearchCell.searchCollectionView.collectionViewLayout.collectionViewContentSize.height
            SearchCell.collectionViewHeight.constant = height
            SearchCell.searchCollectionView.layoutIfNeeded()
            return SearchCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
