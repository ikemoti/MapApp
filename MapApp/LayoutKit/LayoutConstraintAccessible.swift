//
//  LayoutConstraintAccessible.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//

//import Foundation
//
//import UIKit
//
//public protocol LayoutConstraintAccessible {
//    var parentLayoutConstraintAccessible: LayoutConstraintAccessible? { get }
//
//    var heightAnchor: NSLayoutDimension { get }
//    var widthAnchor: NSLayoutDimension { get }
//    var centerXAnchor: NSLayoutXAxisAnchor { get }
//    var centerYAnchor: NSLayoutYAxisAnchor { get }
//    var leftAnchor: NSLayoutXAxisAnchor { get }
//    var rightAnchor: NSLayoutXAxisAnchor { get }
//    var topAnchor: NSLayoutYAxisAnchor { get }
//    var bottomAnchor: NSLayoutYAxisAnchor { get }
//}
//
//extension UILayoutGuide: LayoutConstraintAccessible {
//    public var parentLayoutConstraintAccessible: LayoutConstraintAccessible? { nil }
//}
//
//extension UIView: LayoutConstraintAccessible {
//    public var parentLayoutConstraintAccessible: LayoutConstraintAccessible? { superview }
//}
