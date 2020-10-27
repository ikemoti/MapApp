//
//  LayoutContextBuilder.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//

//import Foundation
//import UIKit
//
//public protocol LayoutBuildable {
//    var context: LayoutContext { get }
//}
//
//@_functionBuilder
//public struct LayoutContextBuilder {
//    public static func buildBlock(_ buildables: LayoutBuildable...) -> LayoutContext {
//        buildables.forEach {
//            _ = $0.context.variableEnd
//        }
//        guard let buildable = buildables.first else {
//            fatalError()
//        }
//        return buildable.context.merged(contexts: buildables.dropFirst().map { $0.context })
//    }
//}
//
//extension UIView {
//    @discardableResult
//    public static func layout(@LayoutContextBuilder _ operation: () -> LayoutContext) -> LayoutContext {
//        let ctx = operation().variableEnd
//        ctx.activate()
//        return ctx
//    }
//
//    @discardableResult
//    public func layout(@LayoutContextBuilder _ operation: () -> LayoutContext) -> LayoutContext {
//        return UIView.layout(operation)
//    }
//}
//
//extension UIViewController {
//    @discardableResult
//    public static func layout(@LayoutContextBuilder _ operation: () -> LayoutContext) -> LayoutContext {
//        return UIView.layout(operation)
//    }
//
//    @discardableResult
//    public func layout(@LayoutContextBuilder _ operation: () -> LayoutContext) -> LayoutContext {
//        return UIView.layout(operation)
//    }
//}
//
//extension NSLayoutConstraint: LayoutBuildable {
//    public var context: LayoutContext {
//        guard let view = firstItem as? LayoutConstraintAccessible else { fatalError() }
//        return LayoutContext(view, constaints: [self])
//    }
//}
//
//extension Array: LayoutBuildable where Element: LayoutContext {
//    public var context: LayoutContext {
//        .merged(self)
//    }
//}
//
