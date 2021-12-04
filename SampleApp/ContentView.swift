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
            
            
            
            TabAView()              // TabAView.swiftの呼び出し
                
                .tabItem {  //　タブアイテム"ToDoリストアイコン"の設定
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("ToDoリスト")
                    }
                }.tag(1)
            
            
            TabBView()              //TabBView.swiftの呼び出し
                
                .tabItem {  //　タブアイテム"おばけ図鑑"の設定
                    VStack {
                        Image(systemName: "eyes")
                        Text("おばけ図鑑")
                    }
                }.tag(2)
            
            
            TabCView()              //TabCView.swiftの呼び出し
               
                .tabItem {   //　タブアイテム"My時間割"の設定
                    VStack{
                        Image(systemName: "tablecells")
                        Text("My時間割")
                    }
                }.tag(3)
            
            
        }//TabView終了
        
        //TabViewに関する設定開始
        .accentColor(.blue)       // タブアイテムの選択時に青色にする
        .environmentObject(SjAndCn()) //　プレビューの際に必要な変数設定
        .environmentObject(Obakeinfo()) //　プレビューの際に必要な変数設定
        //SjAndCn.swiftのクラスからグローバル変数を作成
        //設定終了
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//ContentViewのシミュレーター終了
