//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
        @State var Alist: [String] = []//リストを並べる
        @State var NewAlist = ""   //ユーザーに入力してもらう
        @State var TaskPoint = 0 //タスク完了で得られるポイント
        var body: some View {   //bodyの開始

        NavigationView{

            VStack(alignment: .leading) { //操作部とリストを縦に並べる

                VStack(alignment: .leading) {//テキストとその下の要素を縦に並べる
                    
                    Text("課題をリストに追加しよう！")
                       .font(.footnote)
                       .foregroundColor(.gray)
                    
                    HStack {//入力フィールドとDoneボタンを横に並べる
                        TextField("ToDoを入力", text: $NewAlist) //入力タスクをフィールドに
                            .textFieldStyle(RoundedBorderTextFieldStyle()) //入力フィールドを線で囲む
                        Button(action: { //Doneボタン
                           self.Alist.append(self.NewAlist)//配列に要素を追加
                           self.NewAlist = ""//入力フィールドを空に
                        }) {
                           Text("Done")//ボタンのスタイル
                               .buttonStyle(BorderlessButtonStyle())
                        }.disabled(NewAlist.isEmpty)  //文字が入力されてない時は押せない
                   }//入力フィールドとDoneボタンの横並び終了
                    
                    
               }.padding([.leading, .trailing])
                //テキストからDoneボタンまでの配置終了、両端にスペースを設ける

               List {//リスト表示
                   ForEach(Alist, id: \.self) { user in
                       Text(user)
                    
                   }
                   .onDelete(perform: self.deleteRow) // 削除処理1呼び出し
               }//リスト表示終了
                
                
                HStack {          // ポイントカウント
                    Text("\(TaskPoint)")
                    Text("ポイント獲得")
                    Button(action:{self.TaskPoint = 0}){
                        Text("リセット")
                    }
                }
            }//操作部とリストの縦並び終了
            
            
           .navigationTitle("ToDoリスト")
            
                .toolbar {   //
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination:ListEntryView()){
                            Text("追加")   //遷移ボタン
                        }
                    }
                }
            }//ナビゲーションビューの終了
            
            
       }//bodyの終了
    
    
        func deleteRow(offsets: IndexSet) {     //リスト削除処理
                self.Alist.remove(atOffsets: offsets)   //スライドして削除
                self.TaskPoint += 1 //削除処理の後ポイントを加算
        }
    
        
    }//TabAView終了



struct TabAView_Previews: PreviewProvider {//TabAViewのシミュレーター
    static var previews: some View {
        TabAView()
    }
}//TabAViewのシミュレーター終了
