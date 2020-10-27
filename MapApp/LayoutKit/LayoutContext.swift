//
//  LayoutContext.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//
//
//import Foundation
//import UIKit
//
//public class LayoutContext: LayoutBuildable {
//    public internal(set) var view: LayoutConstraintAccessible!
//    public internal(set) var constraints: [NSLayoutConstraint] = []
//
//    private var transactionDepth: Int = 0
//    public var currentContext: LayoutContext!
//
//    internal var variableContext: LayoutContext?
//
//    public init(_ view: LayoutConstraintAccessible, constaints: [NSLayoutConstraint] = []) {
//        self.view = view
//        constraints = constaints
//    }
//
//    public init(_ context: LayoutContext) {
//        view = context.view
//        variableContext = context.variableContext
//        constraints = context.constraints
//    }
//
//    private init() {
//        view = nil
//    }
//
//    public static var empty: LayoutContext {
//        .init()
//    }
//
//    /// Result of call to 'xxx' is unused 対策
//    @discardableResult
//    func cap() -> Self { self }
//
//    @discardableResult
//    public func printConstrains(file: String = #file, line: Int = #line, function: String = #function) -> Self {
//        return self
//    }
//
//    public var context: LayoutContext { self }
//
//    internal func append(_ constraints: [NSLayoutConstraint]) {
//        constraints.forEach { append($0) }
//    }
//
//    internal func append(_ constraint: NSLayoutConstraint) {
//        constraints.append(constraint)
//    }
//
//    public func merged(contexts: [LayoutContext]) -> LayoutContext {
//        return contexts.reduce(self) { (result, context) -> LayoutContext in
//            result.merged(context)
//        }
//    }
//
//    public func merged(contexts: LayoutContext...) -> LayoutContext {
//        return merged(contexts: contexts)
//    }
//
//    public func merged(_ context: LayoutContext) -> LayoutContext {
//        context.constraints.forEach {
//            self.append($0)
//        }
//        return self
//    }
//
//    public static func merged(_ contexts: [LayoutContext]) -> LayoutContext {
//        let context: LayoutContext = .empty
//        if let first = contexts.first {
//            context.view = first.view
//        }
//        return context.merged(contexts: contexts)
//    }
//
//    public func map(@LayoutContextBuilder _ operation: (LayoutContext) -> LayoutContext) -> LayoutContext {
//        return operation(self)
//    }
//
//    @discardableResult
//    func transaction(_ operation: () -> Void) -> Self {
//        var old: [NSLayoutConstraint]?
//        if transactionDepth == 0 {
//            old = constraints
//        }
//        transactionDepth += 1
//        operation()
//        transactionDepth -= 1
//        if let old = old {
//            currentContext = .init(view, constaints: constraints.filter { !old.contains($0) })
//        }
//        return self
//    }
//
//    public func next(_ view: LayoutConstraintAccessible) -> LayoutContext {
//        self.view = view
//        return self
//    }
//
//    @discardableResult
//    public func activate() -> Self {
//        if constraints.count == 0 {
//
//        }
//        NSLayoutConstraint.activate(constraints)
//        return self
//    }
//}
//
//extension LayoutContext {
//    public func height(_ value: CGFloat) -> Self {
//        transaction {
//            append(view.heightAnchor.constraint(equalToConstant: value))
//        }
//    }
//
//    public func width(_ value: CGFloat) -> Self {
//        transaction {
//            append(view.widthAnchor.constraint(equalToConstant: value))
//        }
//    }
//
//    public func width(toView: LayoutConstraintAccessible, constant: CGFloat = 0, multiplier: CGFloat = 1) -> Self {
//        transaction {
//            append(view.widthAnchor.constraint(equalTo: toView.widthAnchor,
//                                               multiplier: multiplier, constant: constant))
//        }
//    }
//
//    public func size(_ value: CGSize) -> Self {
//        transaction {
//            width(value.width).height(value.height).cap()
//        }
//    }
//
//    public func size(_ value: CGFloat) -> Self {
//        transaction {
//            width(value).height(value).cap()
//        }
//    }
//
//    public func size(_ width: CGFloat, _ height: CGFloat) -> Self {
//        transaction {
//            self.width(width).height(height).cap()
//        }
//    }
//
//    public func size(ratio: CGSize) -> Self {
//        transaction {
//            size(ratio: ratio.width, ratio.height).cap()
//        }
//    }
//
//    public func size(ratio width: CGFloat, _ height: CGFloat) -> Self {
//        transaction {
//            guard height > 0 else { return }
//            append(view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: width / height))
//        }
//    }
//
//    public var square: Self {
//        transaction {
//            size(ratio: 1, 1).cap()
//        }
//    }
//}
//
//extension LayoutContext {
//    public var fit: LayoutFitContext { .init(self) }
//    public func put(_ view: UIView) -> LayoutPutContext { .init(self, nextView: view) }
//    public func align(_ view: UIView) -> LayoutAlignContext { .init(self, secondView: view) }
//    public func margin(_ direction: LayoutMarginContext.Direction) -> LayoutMarginContext {
//        .init(self, direction: direction)
//    }
//}
//
//extension UIView {
//    public var lx: LayoutContext { .init(self) }
//}
