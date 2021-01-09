//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
       @State var alist: [String] = []//リストを並べる
       @State var newalist = ""   //ユーザーに入力してもらう
       var body: some View {  //画面の開始
        
        NavigationView{ //ナビゲーションビューの開始
           VStack(alignment: .leading) { //下部の要素とタスク表示部を縦に並べる
            
               VStack(alignment: .leading) {//下部の要素とテキストを縦に並べる
                   Text("課題をリストに追加しよう！")
                       .font(.footnote)
                       .foregroundColor(.gray)
                
                   HStack {//下部の要素とテキスト入力フィールドを横に並べる
                       TextField("ToDoを入力", text: $newalist)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) //入力フィールドを線で囲む
                    
                       Button(action: { //タスク登録ボタン
                           self.alist.append(self.newalist)
                           self.newalist = ""
                       }) {
                           Text("Done")
                               .buttonStyle(BorderlessButtonStyle())
                       }
                    
                   }//入力フィールドとボタンの横並び終了
                                
               }.padding([.leading, .trailing])
                //テキストと横並び要素の縦並び終了、要素の両端にスペースを設ける
               
               List {
                   ForEach(alist, id: \.self) { user in
                       Text(user)
                   }
                   .onDelete(perform: self.deleteRow) // リスト上にderete呼び出し
               }
           }
           .navigationTitle("ToDoリスト")
            
            }
       }
        func deleteRow(offsets: IndexSet) {
                self.alist.remove(atOffsets: offsets)
            }
    }
struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}


