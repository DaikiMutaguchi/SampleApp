//
//  SampleAppApp.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

@main
struct SwiftUIAppSample: App {
    // swiftlint:disable weak_delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate  // 追加する
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// 以下を追加する
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        sleep(2)
        return true
        
    }
    
}
