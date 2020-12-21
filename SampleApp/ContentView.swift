//
//  ContentView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
     //このファイルは変更しなくて大丈夫！！
        
        TabView {                   //タブビューの宣言
            TabAView()              //TabAView.swiftの呼び出し
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("ToDoリスト")
                    }
            }.tag(1)
            
            TabBView()              //TabBView.swiftの呼び出し
                .tabItem {
                    VStack {
                        Image(systemName: "eyes")
                        Text("おばけ図鑑")
                    }
            }.tag(2)
            
            
            TabCView()              //TabCView.swiftの呼び出し
                .tabItem {
                    VStack {
                        Image(systemName: "tablecells")
                        Text("My時間割")
                    }
            }.tag(3)
        }.accentColor(.blue)       //タブバーの切替で青色にする
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
