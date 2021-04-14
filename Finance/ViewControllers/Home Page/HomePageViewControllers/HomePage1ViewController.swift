//
//  HomePage1ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 16/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class HomePage1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var homePageTableView: UITableView!
    
    var maskimage = [UIImage(named: "MaskGroup")]
    
    var sectionArray = [DataArray]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionArray = [DataArray(section: "Featured", rows: ["1","1","1","1","1"]),
                                  DataArray(section: "Search By Type", rows: ["1","1","1","1","1"]),DataArray(section: "Newly Listed", rows: ["1","1","1","1","1"])]

        homePageTableView.estimatedRowHeight = 720
        setupTableViewCells()
        
        setSearchView(view: searchView)
    }
    
    func setSearchView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
    }
    
    func setupTableViewCells()  {
        let FeaturedCellCellXib = UINib(nibName: "FeaturedCell", bundle: nil)
        homePageTableView.register(FeaturedCellCellXib, forCellReuseIdentifier: "featureCell")
        
        let NewlyListedCellXib = UINib(nibName: "NewlyListedTableViewCell", bundle: nil)
        homePageTableView.register(NewlyListedCellXib, forCellReuseIdentifier: "NewlyListedTableViewCell")

        let SearchByTypeCellXib = UINib(nibName: "SearchByTypeTableViewCell", bundle: nil)
        homePageTableView.register(SearchByTypeCellXib, forCellReuseIdentifier: "searchCollecCell")

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArray[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == homePageTableView {
            let header = UIView(frame: CGRect(x: 20, y: 0, width: self.homePageTableView.frame.size.width, height: 40))
            header.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
            
            let label = UILabel(frame: header.frame)
            label.text = sectionArray[section].section
            label.textAlignment = .left
            label.font = UIFont(name: "Basis Grotesque Pro Medium", size: 17)
            label.textColor = Color.App_theme_color
            header.addSubview(label)
            return header
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let Featuredcell = tableView.dequeueReusableCell(withIdentifier: "featureCell", for: indexPath) as! FeaturedCell
            let height = Featuredcell.collectionView.collectionViewLayout.collectionViewContentSize.height
            Featuredcell.collectionViewHeight.constant = height
            Featuredcell.collectionView.layoutIfNeeded()
            return Featuredcell
        }else if indexPath.row == 1 {
            let SearchCell = tableView.dequeueReusableCell(withIdentifier: "searchCollecCell", for: indexPath) as! SearchByTypeTableViewCell
            let height = SearchCell.searchCollectionView.collectionViewLayout.collectionViewContentSize.height
            SearchCell.collectionViewHeight.constant = height
            SearchCell.searchCollectionView.layoutIfNeeded()
            return SearchCell
        }else if indexPath.row == 2 {
            let NewlyCell = tableView.dequeueReusableCell(withIdentifier: "NewlyListedTableViewCell", for: indexPath) as! NewlyListedTableViewCell
            let height = NewlyCell.newlyListedCollectionView.collectionViewLayout.collectionViewContentSize.height
            NewlyCell.newlyCollectionViewHeight.constant = height
            NewlyCell.newlyListedCollectionView.layoutIfNeeded()
            return NewlyCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
