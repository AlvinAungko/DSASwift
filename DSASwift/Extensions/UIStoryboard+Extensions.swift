//
//  UIStoryboard+Extensions.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import Foundation
import UIKit

public protocol Storyboarded {
    static var storyboard: String { get set }
    static func instantiate(from bundle: Bundle) -> Self
}

extension Storyboarded where Self: UIViewController {
    public static func instantiate(from bundle: Bundle = Bundle.main) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: Self.className) as! Self
    }
}

extension Storyboarded where Self: UINavigationController {
    public static func instantiate(from bundle: Bundle = Bundle.main) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: Self.className) as! Self
    }
}
