//
//  LayoutPutContext.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//
//
//import Foundation
//import UIKit
//
//public class LayoutPutContext: LayoutContext {
//    public let nextView: LayoutConstraintAccessible
//
//    public init(_ context: LayoutContext, nextView: LayoutConstraintAccessible) {
//        self.nextView = nextView
//        super.init(context)
//    }
//
//    public var next: LayoutContext { .init(nextView, constaints: constraints) }
//
//    public var under: Self { under(0) }
//    public func under(_ margin: CGFloat) -> Self {
//        transaction {
//            append(view.bottomAnchor.constraint(equalTo: nextView.topAnchor, constant: -margin))
//        }
//    }
//
//    public var toRight: Self { toRight(0) }
//    public func toRight(_ margin: CGFloat) -> Self {
//        transaction {
//            append(view.rightAnchor.constraint(equalTo: nextView.leftAnchor, constant: -margin))
//        }
//    }
//
//    public func toRight(gte margin: CGFloat) -> Self {
//        transaction {
//            append(view.rightAnchor.constraint(lessThanOrEqualTo: nextView.leftAnchor, constant: -margin))
//        }
//    }
//
//    public func toRight(lte margin: CGFloat) -> Self {
//        transaction {
//            append(view.rightAnchor.constraint(greaterThanOrEqualTo: nextView.leftAnchor, constant: -margin))
//        }
//    }
//
//    public var toLeft: Self { toLeft(0) }
//    public func toLeft(_ margin: CGFloat) -> Self {
//        transaction {
//            append(view.leftAnchor.constraint(equalTo: nextView.rightAnchor, constant: margin))
//        }
//    }
//
//    public func toLeft(gte margin: CGFloat) -> Self {
//        transaction {
//            append(view.leftAnchor.constraint(greaterThanOrEqualTo: nextView.rightAnchor, constant: margin))
//        }
//    }
//
//    public func toLeft(lte margin: CGFloat) -> Self {
//        transaction {
//            append(view.leftAnchor.constraint(lessThanOrEqualTo: nextView.rightAnchor, constant: margin))
//        }
//    }
//}
//
