//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
    @State private var toDo = "" //ユーザー入力
    @State private var buttonLabel = "" //ボタンに表示する
    @State private var inputValue = "" //
    var body: some View {
        
        NavigationView { //ナビゲーションビュー
            List(1..<2) { index in
                            NavigationLink(destination:
                                        Text("遷移先画面")){ Text("\(index)行目")
                                        }
                
                
                VStack { //縦に並べます
                           TextField("ToDoを追加する", text: $toDo) //テキストフィールド設定
                               .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                               .padding()  // 余白を追加
                }
            }.navigationTitle("ToDoリスト")//タイトル
            
            
            }
        }
    }

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}


