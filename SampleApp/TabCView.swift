//
//  TabCView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabCView: View {
    
    var body: some View {
           NavigationView {VStack {
                    
               NavigationLink(destination: TBDataView()) {
                
                HStack{
                   ZStack {
                       Image("TbBG")
                           .resizable()
                           .frame(width: 70, height: 130)
                        Text("システム論")
                    
                    
                   }
                    
                    ZStack {
                        Image("TbBG")
                            .resizable()
                            .frame(width: 70, height: 130)
                         Text("演習")
                     
                     
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
}



struct TBDataView: View {
    
    @State var name : String = ""
    @State var message : String = ""
    @State var editting = false
    
    
    var body: some View {
        VStack {
            TextField("名前を入力して下さい", text: $name,
                      
                onEditingChanged: { begin in
                    /// 入力開始処理
                    if begin {
                        self.editting = true    // 編集フラグをオン
                        self.message = ""       // メッセージをクリア
                            
                        /// 入力終了処理
                    } else {
                        self.editting = false   // 編集フラグをオフ
                    }
                },
 
                /// リターンキーが押された時の処理
                onCommit: {
                    self.message = "月曜日１限：\(self.name)"   // メッセージセット
                    self.name = ""  // 入力域をクリア
                    
                })
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                .padding()      // 余白を追加
                // 編集フラグがONの時に枠に影を付ける
                .shadow(color: editting ? .blue : .clear, radius: 3)
            
            Text(verbatim: message)
        }
    }
}


struct TBDataView_Previews: PreviewProvider {
    static var previews: some View {
        TBDataView()
        }
    }
