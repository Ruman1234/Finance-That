//
//  ImageGalleryViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import ImageViewer_swift

class ImageGalleryViewController: UIViewController {

    @IBOutlet weak var imageGalleryCollectionView: UICollectionView!
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageGalleryCollectionView.delegate = self
        imageGalleryCollectionView.dataSource = self
        
    }

    @IBAction func backBtn(_ sender: Any) {
    }
    
    @IBAction func shareBtn(_ sender: Any) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "ShareViewController") as! ShareViewController
        main.modalPresentationStyle = .overCurrentContext
        main.modalTransitionStyle = .crossDissolve
        present(main, animated: true, completion: nil)
    }
    
    func thirdTourBtn(button: UIButton) {
        button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        button.layer.cornerRadius = 15
    }
}

extension ImageGalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageGalleryCollectionViewCell", for: indexPath) as! ImageGalleryCollectionViewCell
        thirdTourBtn(button: cell.thirdTourBtn)
        cell.img.setupImageViewer()
        return cell
    }
}

extension ImageGalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 160, height: 145)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
