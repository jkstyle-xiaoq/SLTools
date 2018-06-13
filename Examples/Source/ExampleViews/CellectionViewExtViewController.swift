//
//  CellectionViewExtViewController.swift
//  Examples
//
//  Created by kentjia on 2018/6/12.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

class CellectionViewExtViewController: UICollectionViewController {

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
        if let cell = self.collectionView?.sl_cell(forCellSubview: clickedView),
            let indexPath = self.collectionView?.sl_indexPath(forCellSubview: clickedView){
            
            let label = cell.viewWithTag(100) as! UILabel
            label.text = "Item: \(indexPath.item)"
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell-1", for: indexPath)
        return cell
    }
}
