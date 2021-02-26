//
//  TBDataView.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/02/26.
//

import SwiftUI

struct TBDataView: View {
    //変数の設定
    @State var subname : String = ""
    @State var submessage : String = ""
    @State var subeditting = false
    
    @State var clname : String = ""
    @State var clmessage : String = ""
    @State var cleditting = false
    
    
    
    var body: some View {
        VStack {//①〜④を縦に表示
            //入力テキスト表示エリア
            Text(verbatim: submessage)//①
            Text(verbatim: clmessage)//②
            
            //テキストフィールド設定
            TextField("科目名を入力して下さい", text: $subname,//③
                      
                onEditingChanged: { begin in//編集中に関する処理開始
                    //入力開始処理
                    if begin {
                        self.subeditting = true    // 編集フラグをオン
                        self.submessage = ""       // メッセージをクリア
                        //入力終了処理
                    }
                    
                    else {
                        self.subeditting = false   // 編集フラグをオフ
                    }
                },//編集中に関する処理終了
 
                
                onCommit: {//リターンキーが押された時の処理
                    self.submessage = "科目名：\(self.subname)"   // メッセージセット
                    self.subname = ""  // 入力域をクリア
                }
                //リターンキー処理終了
                
            )//テキストフィールド終了
            
            //テキストフィールドに関する設定
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                .padding()      // 余白を追加
                // 編集フラグがONの時に枠に影を付ける
                .shadow(color: subeditting ? .blue : .clear, radius: 3)
            //設定終了
            
            
            //テキストフィールド④
            TextField("教室を入力して下さい", text: $clname,
                      
                onEditingChanged: { begin in
                    
                    if begin {
                        self.cleditting = true
                        self.clmessage = ""
                            
                        
                    }
                    else {
                        self.cleditting = false
                    }
                },
 
                
                
                onCommit: {
                    self.clmessage = "教室：\(self.clname)"
                    self.clname = ""
                    
                }
            
            )//テキストフィールド終了
            
            //テキストフィールドに関する設定
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .shadow(color: cleditting ? .blue : .clear, radius: 3)
            //設定終了
            
            
            
            
        }//Vstack終了
    }//body終了
}//TBDataView終了


//TBDataViewプレビュー
struct TBDataView_Previews: PreviewProvider {
    static var previews: some View {
        TBDataView()
    }
}
