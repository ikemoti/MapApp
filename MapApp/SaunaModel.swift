//
//  SaunaModel.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/24.
//

import Foundation

struct Sauna: Decodable {
    let name: String
    let address: String
    let openTime: String
    let closeTime: String
    let timeException: String?
    let url: String
}
//平日か休日で時間変わる、例外の場合どうする？
//

//struct SaunaTime {
//    enum weekday {
//      case workDay, holiday
//    }
//
//    var openTime: Date {
//        switch  {
//            case <#pattern#>:
//                <#code#>
//            default:
//                <#code#>
//        }
//    }
//}
