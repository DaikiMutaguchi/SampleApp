//
//  ContentView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TabAView()
                .tabItem {
                    VStack {
                        Image(systemName: "a")
                        Text("TabA")
                    }
            }.tag(1)
            TabBView()
                .tabItem {
                    VStack {
                        Image(systemName: "bold")
                        Text("TabB")
                    }
            }.tag(2)
            TabCView()
                .tabItem {
                    VStack {
                        Image("c.png")
                        Text("TabC")
                    }
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
