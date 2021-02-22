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
       var body: some View {
        //bodyの開始
        
        NavigationView{
           VStack(alignment: .leading) { //下部の要素とタスク表示部を縦に並べる
            
               VStack(alignment: .leading) {//下部の要素とテキストを縦に並べる
                   Text("課題をリストに追加しよう！")
                       .font(.footnote)
                       .foregroundColor(.gray)
                
                   HStack {//下部の要素とテキスト入力フィールドを横に並べる
                       TextField("ToDoを入力", text: $newalist)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) //入力フィールドを線で囲む
                    
                       Button(action: { //タスク登録ボタン
                           self.alist.append(self.newalist)//配列に要素を追加
                           self.newalist = ""//入力フィールドを空に
                       }) {
                           Text("Done")//ボタンのスタイル
                               .buttonStyle(BorderlessButtonStyle())
                       }
                    
                   }//入力フィールドとボタンの横並び終了
                                
               }.padding([.leading, .trailing])
                //テキストと横並び要素の縦並び終了、要素の両端にスペースを設けて配置
               
               List {//リスト表示
                   ForEach(alist, id: \.self) { user in
                       Text(user)
                   }
                   .onDelete(perform: self.deleteRow) // 削除処理呼び出し
               }//リスト表示終了
           }//リストと要素の縦並び終了
           .navigationTitle("ToDoリスト")
            
            }//ナビゲーションビューの終了
       }//bodyの終了
        func deleteRow(offsets: IndexSet) {
            //リスト削除処理
                self.alist.remove(atOffsets: offsets)
            //スライドして削除
            
            }
    }//TabAView終了

struct TabAView_Previews: PreviewProvider {//TabAViewのシミュレーター
    static var previews: some View {
        TabAView()
    }
}//TabAViewのシミュレーター終了
