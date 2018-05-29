//
//  MainViewController.swift
//  Examples
//
//  Created by kentjia on 2018/5/28.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit
import SLTools


class MainViewController: UITableViewController {

    private var entries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.prepareEntries()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleEntryCell")
        cell?.textLabel?.text = self.entries[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.sl_cell(forCellSubview: tableView)
    }
    
    private func prepareEntries() {
        self.entries = [
            "TableViewCell Subview",
            "CollectionViewCell Subview"
        ]
    }
}

