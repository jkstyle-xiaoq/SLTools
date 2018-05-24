//
//  UICollectionView+CellSubview.swift
//  SLTools
//
//  Created by kentjia on 2018/5/24.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

extension UICollectionView {

    func sl_cell(forCellSubview view: UIView) -> UICollectionViewCell? {
        var cell: UICollectionViewCell? = nil
        var testView: UIView? = view
        repeat {
            if testView is UICollectionViewCell {
                cell = testView as? UICollectionViewCell
            } else {
                testView = testView?.superview
            }
        } while testView != nil
        
        return cell
    }
    
    func sl_indexPath(forCellSubview view: UIView) -> IndexPath? {
        if let cell = self.sl_cell(forCellSubview: view) {
            return self.indexPath(for: cell)
        }
        return nil
    }
}
