//
//  ContentView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {    //タブビューの宣言
            
            
            TabAView()              //TabAView.swiftの呼び出し
                
                .tabItem {  //タブバーに関する設定
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("ToDoリスト")
                    }//タブバー設定終了
                }.tag(1)
            
            
            TabBView()              //TabBView.swiftの呼び出し
                
                .tabItem {  //タブバーに関する設定
                    VStack {
                        Image(systemName: "eyes")
                        Text("おばけ図鑑")
                    }//タブバー設定終了
                }.tag(2)
            
            
            TabCView()              //TabCView.swiftの呼び出し
               
                .tabItem {   //タブバーに関する設定
                    VStack{
                        Image(systemName: "tablecells")
                        Text("My時間割")
                    }//タブバー設定終了
                }.tag(3)
            
            
        }//TabView終了
        
        //TabViewに関する設定開始
        .accentColor(.blue)       //タブバーの切替で青色にする
        //設定終了
        
        
        
        .environmentObject(SjAndCn())
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
