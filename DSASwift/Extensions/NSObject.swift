//
//  NSObject.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import Foundation
import UIKit

public extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: className, bundle: Bundle.init(for: Self.self))
    }
}
