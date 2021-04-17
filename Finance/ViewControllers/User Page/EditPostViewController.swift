//
//  EditPostViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 29/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class EditPostViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!

    @IBOutlet weak var eidtPostLbl: UILabel!
    @IBOutlet weak var addPhotoLbl: UILabel!
    @IBOutlet weak var editNameLbl: UILabel!
    @IBOutlet weak var editLocationLbl: UILabel!
    @IBOutlet weak var editExpireDate: UILabel!
    @IBOutlet weak var postStatusLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var editNameTextField: CustomTextField!
    @IBOutlet weak var editLocationTextField: CustomTextField!
    @IBOutlet weak var editExpireDateTextField: CustomTextField!
    @IBOutlet weak var postStatusTextField: CustomTextField!
    @IBOutlet weak var priceTextField: CustomTextField!
    
    @IBOutlet weak var addPhotoCollectionView: UICollectionView!
    
    let imagePicker = UIImagePickerController()
    var imagesArray = [UIImage(named: "browseImage")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPhotoCollectionView.delegate = self
        addPhotoCollectionView.dataSource = self
        
        eidtPostLbl.textColor = Color.App_theme_color
        addPhotoLbl.textColor = Color.App_theme_color
        editNameLbl.textColor = Color.App_theme_color
        editLocationLbl.textColor = Color.App_theme_color
        editExpireDate.textColor = Color.App_theme_color
        postStatusLbl.textColor = Color.App_theme_color
        priceLbl.textColor = Color.App_theme_color
        
        saveBtn.setButtonTheme()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        addPhotoCollectionView.collectionViewLayout = layout
        addPhotoCollectionView.isScrollEnabled = true
        
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 883)
    }

    @IBAction func saveBtn(_ sender: Any) {
    }
    
    func openGallery()  {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
}

extension EditPostViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addPhotoCell", for: indexPath) as! AddPhotoCollectionViewCell
        cell.carImages.image = self.imagesArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.row == 1{
            openGallery()
//        }
        
    }
    
}
extension EditPostViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
extension EditPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            self.imagesArray.append(image)
            self.addPhotoCollectionView.reloadData()
        }
       
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
