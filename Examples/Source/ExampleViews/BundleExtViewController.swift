//
//  BundleExtViewController.swift
//  Examples
//
//  Created by kentjia on 2018/6/12.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

class BundleExtViewController: UIViewController, UITableViewDataSource {

    static var CellID = "CellID"
    
    private var datas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let bundleID = Bundle.main.sl_bundleID() {
            self.datas.append("Bundle ID: \(bundleID)")
        }
        
        if let shortVersion = Bundle.main.sl_shortVersion() {
            self.datas.append("Short Version: \(shortVersion)")
        }
        
        if let bundleVersion = Bundle.main.sl_bundleVersion() {
            self.datas.append("Bundle Version: \(bundleVersion)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BundleExtViewController.CellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: BundleExtViewController.CellID)
        }
        
        cell?.textLabel?.text = self.datas[indexPath.row]
        
        return cell!
    }
}
