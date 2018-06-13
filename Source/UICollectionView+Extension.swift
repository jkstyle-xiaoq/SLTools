//
//  UICollectionView+CellSubview.swift
//  SLTools
//
//  Created by kentjia on 2018/5/24.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

extension UICollectionView {

    @objc public func sl_cell(forCellSubview view: UIView) -> UICollectionViewCell? {
        var testView: UIView? = view
        repeat {
            if let cell = testView as? UICollectionViewCell {
                return cell
            } else {
                testView = testView?.superview
            }
        } while testView != nil
        
        return nil
    }
    
    @objc public func sl_indexPath(forCellSubview view: UIView) -> IndexPath? {
        if let cell = self.sl_cell(forCellSubview: view) {
            return self.indexPath(for: cell)
        }
        return nil
    }
}
