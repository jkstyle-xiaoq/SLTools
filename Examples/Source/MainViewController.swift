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
        self.title = "Examples"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

