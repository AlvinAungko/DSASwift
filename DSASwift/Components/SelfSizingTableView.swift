//
//  SelfSizingTableView.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import Foundation
import UIKit

open class SelfSizedTableView: UITableView {
    
    var maxHeight: CGFloat = .greatestFiniteMagnitude
    
    open override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    open override var intrinsicContentSize: CGSize {
        setNeedsLayout()
        layoutIfNeeded()
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
    
}
