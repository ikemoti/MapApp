//
//  LayoutContext+Remake.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//

//import Foundation
//import UIKit
//
//extension LayoutContext {
//    public func remake() -> Self {
//        constraints.forEach {
//            $0.isActive = false
//        }
//        constraints.removeAll()
//        return self
//    }
//
//    public func remake(@LayoutContextBuilder _ builder: (Self) -> LayoutContext) -> LayoutContext {
//        _ = remake()
//        return builder(self as! Self) // swiftlint:disable:this force_cast
//    }
//
//    public func remake(@LayoutContextBuilder _ builder: () -> LayoutContext) -> LayoutContext {
//        _ = remake()
//        let built = builder()
//        view = built.view
//        constraints = built.constraints
//        activate()
//        return self
//    }
//}
