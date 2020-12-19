//
//  TabCView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabCView: View {
    let Youbi = ["月" , "火" , "水" , "木" , "金"]
    var body: some View {
        //ナビゲーションビューの開始
           NavigationView  {
                    
            
                //横に時間割列を配置
                HStack{
                    
                    
                    
                    ForEach((0...4), id: \.self) { Date in
                        
                    VStack{
                        
                        
                        ZStack {
                            Image("Youbi")
                                .resizable()
                                .frame(width: 65, height: 20)
                            Text(Youbi[Date])
                        }
                        
                        ForEach((1...5), id: \.self) { time in
                            
                        NavigationLink(destination:TBDataView()){
                            
                            ZStack {
                                Image("TbBG")
                                        .resizable()
                                        .frame(width: 65, height: 100)
                                Text("\(Date*5+time)")
                                }
                                
                                }
                            }
                    }
                        
                    }
                    
                }
                .navigationTitle("My時間割")
            }
        
           }
       }
    


struct TabCView_Previews: PreviewProvider {
    static var previews: some View {
        TabCView()
        }
    }



struct TBDataView: View {
    
    @State var subname : String = ""
    @State var submessage : String = ""
    @State var subeditting = false
    
    @State var clname : String = ""
    @State var clmessage : String = ""
    @State var cleditting = false
    
    
    var body: some View {
        VStack {
            //入力テキスト表示エリア
            Text(verbatim: submessage)
            Text(verbatim: clmessage)
            //テキスト終了
            
            
            //テキストフィールド設定
            TextField("科目名を入力して下さい", text: $subname,
                      
                onEditingChanged: { begin in
                    /// 入力開始処理
                    if begin {
                        self.subeditting = true    // 編集フラグをオン
                        self.submessage = ""       // メッセージをクリア
                            
                        /// 入力終了処理
                    } else {
                        self.subeditting = false   // 編集フラグをオフ
                    }
                },
 
                /// リターンキーが押された時の処理
                onCommit: {
                    self.submessage = "科目名：\(self.subname)"   // メッセージセット
                    self.subname = ""  // 入力域をクリア
                    
                })
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                .padding()      // 余白を追加
                // 編集フラグがONの時に枠に影を付ける
                .shadow(color: subeditting ? .blue : .clear, radius: 3)
            
            
            TextField("教室を入力して下さい", text: $clname,
                      
                onEditingChanged: { begin in
                    /// 入力開始処理
                    if begin {
                        self.cleditting = true    // 編集フラグをオン
                        self.clmessage = ""       // メッセージをクリア
                            
                        /// 入力終了処理
                    } else {
                        self.cleditting = false   // 編集フラグをオフ
                    }
                },
 
                /// リターンキーが押された時の処理
                onCommit: {
                    self.clmessage = "教室：\(self.clname)"   // メッセージセット
                    self.clname = ""  // 入力域をクリア
                    
                })
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                .padding()      // 余白を追加
                // 編集フラグがONの時に枠に影を付ける
                .shadow(color: cleditting ? .blue : .clear, radius: 3)
            //テキストフィールド設定終了
            
        }
    }
}


struct TBDataView_Previews: PreviewProvider {
    static var previews: some View {
        TBDataView()
        }
    }

