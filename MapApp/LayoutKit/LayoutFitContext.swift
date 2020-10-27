//
//  LayoutFitContext.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//

//import UIKit
//
//public class LayoutFitContext: LayoutContext {
//    public let superview: LayoutConstraintAccessible
//
//    public struct Edge: OptionSet {
//        public var rawValue: Int
//
//        public init(rawValue: Int) {
//            self.rawValue = rawValue
//        }
//
//        public static let left = Edge(rawValue: 1 << 0)
//        public static let right = Edge(rawValue: 1 << 1)
//        public static let top = Edge(rawValue: 1 << 2)
//        public static let bottom = Edge(rawValue: 1 << 3)
//
//        public static let all: Edge = [.left, .right, .top, .bottom]
//    }
//    
//    override public init(_ context: LayoutContext) {
//        guard let superview = context.view.parentLayoutConstraintAccessible else {
//            fatalError()
//        }
//        if let scrollView = superview as? UIScrollView {
//            self.superview = scrollView.contentLayoutGuide
//        } else {
//            self.superview = superview
//        }
//        super.init(context)
//    }
//
//   
//
//    public var left: Self { left(0) }
//    public func left(_ inset: CGFloat) -> Self {
//        transaction {
//            append(view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: inset))
//        }
//    }
//
//    public var right: Self { right(0) }
//    public func right(_ inset: CGFloat) -> Self {
//        transaction {
//            append(view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -inset))
//        }
//    }
//
//    public func right(gte inset: CGFloat) -> Self {
//        transaction {
//            append(view.rightAnchor.constraint(lessThanOrEqualTo: superview.rightAnchor, constant: -inset))
//        }
//    }
//
//    public var side: Self { side(0) }
//    public func side(_ inset: CGFloat) -> Self {
//        transaction {
//            left(inset).right(inset).cap()
//        }
//    }
//
//    public var top: Self { top(0) }
//    public func top(_ inset: CGFloat) -> Self {
//        transaction {
//            append(view.topAnchor.constraint(equalTo: superview.topAnchor, constant: inset))
//        }
//    }
//
//    public var bottom: Self { bottom(0) }
//    public func bottom(_ inset: CGFloat) -> Self {
//        transaction {
//            append(view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset))
//        }
//    }
//
//    public func bottom(gte inset: CGFloat) -> Self {
//        transaction {
//            append(view.bottomAnchor.constraint(lessThanOrEqualTo: superview.bottomAnchor, constant: -inset))
//        }
//    }
//
//    public var size: Self {
//        transaction {
//            width.height.cap()
//        }
//    }
//
//    public var width: Self {
//        transaction {
//            width(appending: 0, multiplier: 1).cap()
//        }
//    }
//
//    public func width(appending: CGFloat) -> Self {
//        transaction {
//            width(appending: appending, multiplier: 1).cap()
//        }
//    }
//
//    public func width(multiplier: CGFloat) -> Self {
//        transaction {
//            width(appending: 0, multiplier: multiplier).cap()
//        }
//    }
//
//    public func width(appending: CGFloat, multiplier: CGFloat) -> Self {
//        transaction {
//            append(view.widthAnchor.constraint(equalTo: superview.widthAnchor,
//                                               multiplier: multiplier, constant: appending))
//        }
//    }
//
//    public var height: Self { height() }
//    public func height(appending: CGFloat = 0) -> Self {
//        transaction {
//            height(appending: appending, multiplier: 1).cap()
//        }
//    }
//
//    public func height(multiplier: CGFloat) -> Self {
//        transaction {
//            height(appending: 0, multiplier: multiplier).cap()
//        }
//    }
//
//    public func height(appending: CGFloat, multiplier: CGFloat) -> Self {
//        transaction {
//            append(view.heightAnchor.constraint(equalTo: superview.heightAnchor,
//                                                multiplier: multiplier, constant: appending))
//        }
//    }
//
//    public var edge: Self { edge(.zero) }
//    public func edge(_ insets: UIEdgeInsets) -> Self {
//        transaction {
//            edge(insets, .all).cap()
//        }
//    }
//
//    public func edge(_ mask: Edge) -> Self {
//        transaction {
//            edge(.zero, mask).cap()
//        }
//    }
//
//    public func edge(_ masks: Edge...) -> Self {
//        transaction {
//            edge(.zero, masks.union()).cap()
//        }
//    }
//
////    public func edge(_ inset: CGFloat) -> Self {
////        transaction {
////            edge(UIEdgeInsets(from: inset as! Decoder), .all).cap()
////        }
////    }
////
////    public func edge(_ inset: CGFloat, _ masks: Edge...) -> Self {
////        transaction {
////            edge(UIEdgeInsets(inset), masks.union()).cap()
////        }
////    }
//
//    public func edge(_ insets: UIEdgeInsets, _ mask: Edge = .all) -> Self {
//        transaction {
//            if mask.contains(.top) { top(insets.top).cap() }
//            if mask.contains(.right) { right(insets.right).cap() }
//            if mask.contains(.bottom) { bottom(insets.bottom).cap() }
//            if mask.contains(.left) { left(insets.left).cap() }
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
//            append(view.centerXAnchor.constraint(equalTo: superview.centerXAnchor))
//        }
//    }
//
//    public var centerY: Self {
//        transaction {
//            append(view.centerYAnchor.constraint(equalTo: superview.centerYAnchor))
//        }
//    }
//    public func centerY(_ value: CGFloat) {
//        transaction {
//            append(view.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 1))
//        }
//    }
//}
//extension Array where Element: OptionSet, Element.RawValue == Int {
//    public func union() -> Element {
//        reduce(Element(rawValue: 0)) { (result, element) -> Element in
//            result.union(element)
//        }
//    }
//}
