//
//  Logger.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

//import Foundation
//import AppCenterAnalytics
//
//class Log {
//
//    class func verbose(_ message: String) {
//        Analytics.trackEvent(message, withProperties: ["version" : Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String,
//                                                       "type" : "verbose"])
//        print("⚫️ \(message)")
//    }
//
//    class func warn(_ message: String) {
//        Analytics.trackEvent(message, withProperties: ["version" : Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String,
//                                                       "type" : "warn"])
//        print("🟡 \(message)")
//    }
//
//    class func error(_ error: Error) {
//        print("🔴")
//        dump(error)
//        if let error = error as? DodamError,
//           case let .error(message, type, _) = error {
//            Analytics.trackEvent("error", withProperties: ["type":type.rawValue, "errorMsg":message])
//            print("🔴 \(message)")
//        } else {
//            var errorDumped = String()
//            dump(error, to: &errorDumped)
//            Analytics.trackEvent("error", withProperties: ["version" : Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String, "type":ErrorType.unhandled.rawValue, "errorMsg":error.localizedDescription, "dump": errorDumped])
//            print("🔴 \(error.localizedDescription)")
//        }
//    }
//}
