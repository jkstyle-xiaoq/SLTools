//
//  TableViewExtViewController.swift
//  Examples
//
//  Created by kentjia on 2018/6/12.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

class TableViewExtViewController: UITableViewController {
    
    static var CellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickMe(_ sender: Any) {
        let clickedView = sender as! UIButton
        if let cell = self.tableView.sl_cell(forCellSubview: clickedView),
            let indexPath = self.tableView.sl_indexPath(forCellSubview: clickedView){
            
            let label = cell.viewWithTag(100) as! UILabel
            label.text = "Row: \(indexPath.row)"
        }
    }
}
