//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
    @State private var todo = ""
    var body: some View {
        VStack {
                   TextField("ToDoを追加する", text: $todo)
                       .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                       .padding()  // 余白を追加
                   Text("入力テスト：\(todo)")
               }
        NavigationView {
            List(1..<10) { index in
                            NavigationLink(destination:
                                         Text("遷移先画面")){ Text("\(index)行目")
                                        }
                        }.navigationTitle("ToDoリスト")
            }
        }
    }

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}


