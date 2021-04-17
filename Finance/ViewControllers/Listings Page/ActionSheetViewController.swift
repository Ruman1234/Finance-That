//
//  ActionSheetViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 29/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
protocol ActionSheetViewControllerDelegate {
    func didSendBAck(Index : Int,Selection :String)
    func didClose()
}
class ActionSheetViewController: UIViewController{

    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var ActionSheetTableView: UITableView!
    
    var LblNamesArr = [String]()
    var delegate : ActionSheetViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ActionSheetTableView.delegate = self
        ActionSheetTableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        let height = ActionSheetTableView.contentSize.height
        if height > 500{
            tableViewHeight.constant = 500
        }else{
            tableViewHeight.constant = ActionSheetTableView.contentSize.height
        }
        ActionSheetTableView.layoutIfNeeded()
        self.ActionSheetTableView.reloadData()
    }
}
extension ActionSheetViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LblNamesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionSheetTableViewCell", for: indexPath) as! ActionSheetTableViewCell
        cell.lbl.text = LblNamesArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.didSendBAck(Index: indexPath.row, Selection: LblNamesArr[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}
