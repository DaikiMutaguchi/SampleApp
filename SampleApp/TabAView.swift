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
    @State private var message = "ここをリスト表示したい" //
    var body: some View {
        
        NavigationView { //ナビゲーションビュー
            List(1..<6) { index in
                            NavigationLink(destination:
                                        Text("遷移先画面")){ Text("\(index)行目")
                                        }
                Text(message)
                .navigationBarTitle("ToDoリスト", displayMode: .automatic)
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.message = "ボタンは機能してます"
                        }) {
                                    Image(systemName: "plus")
                        }
                    )
            }
        }
        
        
        
        }
    }


struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}



struct ListInput {
    @State private var memo = "仮" //
    var body: some View {
        NavigationView { //ナビゲーションビュー
            Text(memo)
            .navigationBarTitle("ToDoリスト", displayMode: .automatic)

        }
        

        
    }
}



