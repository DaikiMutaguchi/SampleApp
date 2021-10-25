//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
    @State var Alist: [String] = Array(repeating: "", count: 200)
   
        @State var NewAlist = ""   //ユーザーに入力してもらう
        @State private var isChecked = false
        @State var i = 0
    
        @EnvironmentObject var TaskPoint: SjAndCn //タスク完了で得られるポイント
   
        var body: some View {
            //bodyの開始

            ZStack{
                // 背景色指定
                Color(red: 0.88, green: 0.96, blue:1.0).edgesIgnoringSafeArea(.all)
            VStack{
                VStack(alignment: .leading) { //テキストとその下の要素を縦に並べる
                    Text("ToDoList")
                        .font(.system(size: 40, weight: .black, design: .rounded))
                        .padding(15)
                        .foregroundColor(Color.init(red: 0.12, green: 0.20, blue: 0.70))
                   
                    
                    HStack {
                        //入力フィールドとDoneボタンを横に並べる
                        TextField("ToDoを入力", text: $NewAlist)   //入力タスクをフィールドに
                            .textFieldStyle(RoundedBorderTextFieldStyle()) //入力フィールドを線で囲む
                        
                        
                        Button(action: {
                            //Doneボタン
                           self.Alist[i] = NewAlist//配列に要素を追加
                            
                            
                            
                            UIImpactFeedbackGenerator(style: .medium)
                            .impactOccurred()
                           self.NewAlist = ""//入力フィールドを空に
                           self.i += 1
                            
                        }) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                              
                            
                        }.disabled(NewAlist.isEmpty)  //文字が入力されてない時は押せない
                   }    //入力フィールドとDoneボタンの横並び終了
                    
                    
               }.padding([.leading, .trailing])
                //テキストからDoneボタンまでの配置終了、両端にスペースを設ける

                ZStack(alignment: .bottomTrailing) {
                
                    
                    
           
                List{
                   
                ForEach(Alist.filter { !$0.isEmpty }, id: \.self){ user in
                    
                    HStack{
                        Button(action:toggle){
                                    if(isChecked) {
                                      
                                        Image(systemName: "checkmark.square.fill")
                                            .foregroundColor(.green)
                                    
                                        
                                    } else {
                                        Image(systemName: "square")
                                    }
                                }
                        Text(user)
                            
                            .font(.system(size: 20))
                            .foregroundColor(Color.init(red: 0.12, green: 0.20, blue: 0.70))
                        
                          
                    }
                     
                   
                }.onDelete(perform: self.deleteRow)     // 削除処理1呼び出し
                
                .listRowBackground(Color.init(red: 1.0, green: 1.0, blue: 1.0))
                
                
                      
                    
             }.listStyle(InsetGroupedListStyle())
                .onAppear {
                    UITableView.appearance().backgroundColor = UIColor(red: 0.88, green: 0.96, blue:1.0 ,alpha: 1.0)
                    
                }
                .onDisappear {
                }
                    
              
                        
                       
               
                }
                Image("ObakeWhite")
                    .offset(x: 150, y: 80)
                
                
                
                              //  HStack {          // ポイントカウント
                              //             Text("\(TaskPoint.Point)")
                              //             Text("ポイント獲得")
                              //              Button(action:{self.TaskPoint.Point = 0}){
                              //             Text("リセット")
                              //              }
                              //          }
                                
            }
            
           
            }
            
            
       }    //bodyの終了
    
    
    
    func deleteRow(offsets: IndexSet) {
        //リスト削除処理
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
    
        
    }   //TabAView終了

//TabAViewのシミュレーター
struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
            .environmentObject(SjAndCn())
    }
}
//開始クロージャと同じ行にコメントするとシミュレータ表示できないバグ起こる
//TabAViewのシミュレーター終了
