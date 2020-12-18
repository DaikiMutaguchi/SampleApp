//
//  ContentView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {                   //テーブルビューの宣言
            TabAView()              //リストタブの表示
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("ToDoリスト")
                    }
            }.tag(1)
            
            TabBView()              //お化け表示画面の設定
                .tabItem {
                    VStack {
                        Image(systemName: "eyes")
                        Text("おばけ図鑑")
                    }
            }.tag(2)
            
            
            TabCView()              //時間割アプリの表示
                .tabItem {
                    VStack {
                        Image(systemName: "tablecells")
                        Text("My時間割")
                    }
            }.tag(3)
        }.accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
