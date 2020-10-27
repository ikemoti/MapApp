//
//  LayoutVariableContext.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//
//
//import Foundation
//
//import UIKit
//
//extension LayoutContext {
//    public func variable(_ context: inout LayoutContext?) -> Self {
//        if let ctx = context {
//            context = context?.merged(ctx)
//        } else {
//            context = LayoutContext(self)
//        }
//        variableContext = context
//        return self
//    }
//
//    public var variableEnd: Self {
//        if let variableContext = variableContext {
//            let result = constraints.filter { !variableContext.constraints.contains($0) }
//            variableContext.constraints = result
//        }
//        variableContext = nil
//        return self
//    }
//
//    public func variable(_ context: inout LayoutContext?,
//                         @LayoutContextBuilder _ builder: (LayoutContext) -> LayoutContext) -> LayoutContext {
//        return builder(variable(&context)).variableEnd
//    }
//}
//
