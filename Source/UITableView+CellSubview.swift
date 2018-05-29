//
//  UITableView+CellSubview.swift
//  SLTools
//
//  Created by kentjia on 2018/5/24.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

extension UITableView {

    @objc public func sl_cell(forCellSubview view: UIView) -> UITableViewCell? {
        var cell: UITableViewCell? = nil
        var testView: UIView? = view
        repeat {
            if testView is UITableViewCell {
                cell = testView as? UITableViewCell
            } else {
                testView = testView?.superview
            }
        } while testView != nil
        
        return cell
    }
    
    @objc public func sl_indexPath(forCellSubview view: UIView) -> IndexPath? {
        if let cell = self.sl_cell(forCellSubview: view) {
            return self.indexPath(for: cell)
        }
        return nil
    }
}
