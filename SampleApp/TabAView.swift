//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
        @State var Alist: [String] = ["","要素くん１号",""]//リストを並べる
        @State var NewAlist = ""   //ユーザーに入力してもらう
        @State private var isChecked = false
    
        @EnvironmentObject var TaskPoint: SjAndCn //タスク完了で得られるポイント
        var body: some View {   //bodyの開始

           
            VStack{
                VStack(alignment: .leading) {//テキストとその下の要素を縦に並べる
                    Text("ToDoList")
                        .font(.system(size: 40, weight: .black, design: .rounded))
                    Text("課題をリストに追加しよう！")
                       .font(.footnote)
                       .foregroundColor(.gray)
                    
                    HStack {//入力フィールドとDoneボタンを横に並べる
                        TextField("ToDoを入力", text: $NewAlist) //入力タスクをフィールドに
                            .textFieldStyle(RoundedBorderTextFieldStyle()) //入力フィールドを線で囲む
                        Button(action: { //Doneボタン
                           self.Alist.append(self.NewAlist)//配列に要素を追加
                            UIImpactFeedbackGenerator(style: .medium)
                            .impactOccurred()
                           self.NewAlist = ""//入力フィールドを空に
                        }) {
                           Text("Done")//ボタンのスタイル
                               .buttonStyle(BorderlessButtonStyle())
                            
                        }.disabled(NewAlist.isEmpty)  //文字が入力されてない時は押せない
                   }//入力フィールドとDoneボタンの横並び終了
                    
                    
               }.padding([.leading, .trailing])
                //テキストからDoneボタンまでの配置終了、両端にスペースを設ける

                List{
                ForEach(Alist.filter { !$0.isEmpty }, id: \.self){ user in
                    HStack{
                        Button(action: toggle) {
                                    if(isChecked) {
                                       
                                        Image(systemName: "checkmark.square.fill")
                                            .foregroundColor(.green)
                                    
                                        
                                    } else {
                                        Image(systemName: "square")
                                    }
                                }
                        Text(user)
                    }
                   }
                
                   .onDelete(perform: self.deleteRow) // 削除処理1呼び出し
                }
              
                
                
                
                HStack {          // ポイントカウント
                    Text("\(TaskPoint.Point)")
                    Text("ポイント獲得")
                    Button(action:{self.TaskPoint.Point = 0}){
                        Text("リセット")
                    }
                }
       
            }
            
           
         
            
            
       }//bodyの終了
    
    
        func deleteRow(offsets: IndexSet) {     //リスト削除処理
                self.Alist.remove(atOffsets: offsets)   //スライドして削除
            
        }
        // タップ時の状態の切り替え
        func toggle() -> Void {
            isChecked = !isChecked
            UIImpactFeedbackGenerator(style: .medium)
                .impactOccurred()
            self.TaskPoint.Point += 1
           
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                //
                //ここに行を削除する処理書いたら完璧じゃない？
                //
                
                isChecked = false
            }
            
        }
    
        
    }//TabAView終了



struct TabAView_Previews: PreviewProvider {//TabAViewのシミュレーター
    static var previews: some View {
        TabAView()
            .environmentObject(SjAndCn())
    }
}//TabAViewのシミュレーター終了
