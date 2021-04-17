//
//  AboutPageViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 09/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class AboutPageViewController: UIViewController {

    @IBOutlet weak var aboutUsTableView: UITableView!
    @IBOutlet weak var proudlyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutUsTableView.delegate = self
        aboutUsTableView.dataSource = self
        
        proudlyCollectionView.delegate = self
        proudlyCollectionView.dataSource = self

    }

}

extension AboutPageViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutusTableViewCell", for: indexPath) as! AboutusTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 371
    }
}

extension AboutPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CanadianCollectionViewCell", for: indexPath) as! CanadianCollectionViewCell
        return cell
    }
}
