//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/02/27.
//

import UIKit
import SwiftUI

func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Create the SwiftUI view that provides the window contents.
    let contentView = ContentView()
        .environmentObject(SjAndCn()) // この行でグローバル変数を設定している
 
    // Use a UIHostingController as window root view controller.
    if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        //self.window = window
        window.makeKeyAndVisible()
    }
  }
