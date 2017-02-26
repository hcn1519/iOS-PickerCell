//
//  TableViewController.swift
//
//  Created by 홍창남 on 2017. 2. 26..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

let cellID = "cell"

class TableViewController: UITableViewController {

    var selectedIndexPath: IndexPath?
    
    
//    var dataArray: [[String: String]] = []
//    let titleKey = "title"
//    let detailKey = "detail"
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let itemOne = [titleKey : "Title1", detailKey : "Hello Detail1"] as [String : String]
//        let itemTwo = [titleKey : "Title2", detailKey : "Hello Detail2"] as [String : String]
//        
//        dataArray.append(itemOne)
//        dataArray.append(itemTwo)
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let itemData = dataArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? PickerViewCell
        
//        cell?.titleLabel.text = itemData[titleKey]! as String
//        cell?.detailLabel.text = itemData[detailKey]! as String
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousIndexPath = selectedIndexPath
        
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        
        var indexPaths: Array<IndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        
        if indexPaths.count > 0 {
            tableView.reloadRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! PickerViewCell).watchFrameChanges()
    }
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! PickerViewCell).ignoreFrameChanges()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for cell in tableView.visibleCells as! [PickerViewCell] {
            cell.ignoreFrameChanges()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return PickerViewCell.expandedHeight
        } else {
            return PickerViewCell.defaultheight
        }
    }
    
    
    
}
