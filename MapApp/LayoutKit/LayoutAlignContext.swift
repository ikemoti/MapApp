//
//  LayoutAlignContext.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//

//import Foundation
//
//import UIKit
//
//public class LayoutAlignContext: LayoutContext {
//    public let secondView: LayoutConstraintAccessible
//
//    public init(_ context: LayoutContext, secondView: LayoutConstraintAccessible) {
//        self.secondView = secondView
//        super.init(context)
//    }
//
//    public var left: Self { left(0) }
//    public func left(_ inset: CGFloat) -> Self {
//        transaction {
//            append(view.leftAnchor.constraint(equalTo: secondView.leftAnchor, constant: -inset))
//        }
//    }
//
//    public var right: Self { right(0) }
//    public func right(_ inset: CGFloat) -> Self {
//        transaction {
//            append(view.rightAnchor.constraint(equalTo: secondView.rightAnchor, constant: inset))
//        }
//    }
//
//    public var top: Self { top(0) }
//    public func top(_ inset: CGFloat) -> Self {
//        transaction {
//            append(view.topAnchor.constraint(equalTo: secondView.topAnchor, constant: inset))
//        }
//    }
//
//    public var bottom: Self { bottom(0) }
//    public func bottom(_ inset: CGFloat) -> Self {
//        transaction {
//            append(view.bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: -inset))
//        }
//    }
//
//    public var center: Self {
//        transaction {
//            centerX.centerY.cap()
//        }
//    }
//
//    public var centerX: Self {
//        transaction {
//            append(view.centerXAnchor.constraint(equalTo: secondView.centerXAnchor))
//        }
//    }
//
//    public var centerY: Self {
//        transaction {
//            append(view.centerYAnchor.constraint(equalTo: secondView.centerYAnchor))
//        }
//    }
//}
