//
//  UITableView.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import Foundation
import UIKit

extension UITableView {
    func register(nib nibName: String, bundle: Bundle? = nil) {
        self.register(UINib(nibName: nibName , bundle: bundle), forCellReuseIdentifier: nibName)
    }
    
    func fitToContentHeight(heightConstraint: NSLayoutConstraint!) {
        self.reloadData()
        heightConstraint.constant = 10000
        self.setNeedsLayout()
        self.layoutIfNeeded()
        heightConstraint.constant = self.contentSize.height
    }
}
