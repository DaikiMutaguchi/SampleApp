//
//  TabCView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabCView: View {
    let Youbi = ["月" , "火" , "水" , "木" , "金"]
    let SubTitle = ["0", "月１", "月2","月３","月４","月５"]
    var body: some View {
        //ナビゲーションビューの開始
        NavigationView  {
        ScrollView(.vertical, showsIndicators: false) { //縦画面サイズ調整(iPhone 8用)
                
            //横に下のVStack①を並べる
            HStack{
                
                ForEach((0...4), id: \.self) { Date in //Vstack①を横に５回表示、0=月、4=金
                        
                    VStack{  //下のZStack①と②を縦に表示
                        
                        
                        ZStack { //Zstack①、曜日のマスを表示
                            Image("Youbi")
                                .resizable()
                                .frame(width: 65, height: 20)
                            Text(Youbi[Date]) //配列Youbiの0~4番めの値表示
                    
                        }
                        
                        
                        ForEach((1...5), id: \.self) { time in //Zstack②を縦に5コマ表示させる
                            NavigationLink(destination:TBDataView()){
                            
                            ZStack {//Zstack②
                                Image("TbBG")
                                        .resizable()
                                        .frame(width: 65, height: 100)
                                VStack{
                                Text(SubTitle[Date+1])
                                Text("科目\(Date*5+time)")
                                }
                                
                            }
                                
                                
                            }//ナビゲーションリンク終了
                        }//５コマ表示ループ終了
                    }//各曜日Vstack終了
                        
                }//５曜日分ループ終了
                    
            }//HStack終了
                .navigationTitle("My時間割")
            
        }//スクロールビュー終了
        }//ナビゲーションビュー終了
        
    }//body終了
}//TabCView終了
    

//TabCVIewプレビュー
struct TabCView_Previews: PreviewProvider {
    static var previews: some View {
        TabCView()
    }
}



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

