//
//   LayoutMarginContext.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//
//
//import Foundation
//
//import UIKit
//
//public class LayoutMarginContext: LayoutContext {
//    public enum Direction {
//        case l2r
//        case r2l
//        case t2b
//        case b2t
//
//        func constraint(_ lhs: LayoutConstraintAccessible,
//                        _ margin: CGFloat,
//                        _ rhs: LayoutConstraintAccessible) -> NSLayoutConstraint {
//            switch self {
//                case .l2r: return lhs.rightAnchor.constraint(equalTo: rhs.leftAnchor, constant: -margin)
//                case .r2l: return lhs.leftAnchor.constraint(equalTo: rhs.rightAnchor, constant: margin)
//                case .t2b: return lhs.bottomAnchor.constraint(equalTo: rhs.topAnchor, constant: -margin)
//                case .b2t: return lhs.topAnchor.constraint(equalTo: rhs.bottomAnchor, constant: margin)
//            }
//        }
//
//        func constraint(_ lhs: LayoutConstraintAccessible,
//                        gte margin: CGFloat,
//                        _ rhs: LayoutConstraintAccessible) -> NSLayoutConstraint {
//            switch self {
//                case .l2r: return lhs.rightAnchor.constraint(lessThanOrEqualTo: rhs.leftAnchor, constant: -margin)
//                case .r2l: return lhs.leftAnchor.constraint(greaterThanOrEqualTo: rhs.rightAnchor, constant: margin)
//                case .t2b: return lhs.bottomAnchor.constraint(lessThanOrEqualTo: rhs.topAnchor, constant: -margin)
//                case .b2t: return lhs.topAnchor.constraint(greaterThanOrEqualTo: rhs.bottomAnchor, constant: margin)
//            }
//        }
//    }
//
//    public let direction: Direction
//    public init(_ context: LayoutContext, direction: Direction) {
//        self.direction = direction
//
//        super.init(context)
//    }
//
//    init(_ context: LayoutMarginContext, view: LayoutConstraintAccessible) {
//        direction = context.direction
//        super.init(context)
//        self.view = view
//    }
//
//    public func next(_ value: CGFloat, _ next: LayoutConstraintAccessible) -> LayoutMarginContext {
//        transaction {
//            append(direction.constraint(view, value, next))
//        }
//        return LayoutMarginContext(self, view: next)
//    }
//
//    public func next(gte value: CGFloat, _ next: LayoutConstraintAccessible) -> LayoutMarginContext {
//        transaction {
//            append(direction.constraint(view, gte: value, next))
//        }
//        return LayoutMarginContext(self, view: next)
//    }
//}
//
