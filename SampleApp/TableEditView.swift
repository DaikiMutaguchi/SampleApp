//
//  TableEditView.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/02/26.
//

import SwiftUI



struct TableEditView: View {
    let Date = ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日"]
    let Jikan = ["ダミー","１限","２限","３限","４限","５限"]
    @State var SubTitle: [String] = Array(repeating: "未登録", count: 26)
    @State var ClassNo: [String] = Array(repeating: "未登録", count: 26)
    
    @State private var Dselection = 0
    @State private var Jselection = 0
    
    
    @State var subname : String = ""
    @State var submessage : String = ""
    @State var subeditting = false
    
    @State var clname : String = ""
    @State var clmessage : String = ""
    @State var cleditting = false
    
    @State var DateLoop = 0
    @State var JikanLoop = 0
    
    
    
    var body: some View {
        NavigationView {    // Formで使う場合はNavigationViewが必須
            
            
            Form {
                Picker(selection: $Dselection, label: Text("曜日")) {
                    ForEach(0 ..< Date.count) { num1 in
                        Text(self.Date[num1])
                        
                    }
                }
                
                
                Picker(selection: $Jselection, label: Text("時間")) {
                    ForEach(1 ..< Jikan.count) { num2 in
                        Text(self.Jikan[num2])
                        
                        
                        
                        
                    }
                    
                }
                
                HStack{
                Text("科目")//①
                    Spacer()
                    Text(SubTitle[Dselection*5+Jselection])
                }
                    TextField("科目名を入力して下さい", text: $subname,//③
                              
                        onEditingChanged: { begin in//編集中に関する処理開始
                            //入力開始処理
                            if begin {
                                self.subeditting = true    // 編集フラグをオン
                                self.SubTitle[Dselection*5+Jselection] = ""       // メッセージをクリア
                                //入力終了処理
                            }
                            
                            else {
                                self.subeditting = false   // 編集フラグをオフ
                                self.SubTitle[Dselection*5+Jselection] = "\(self.subname)"   // メッセージセット
                                self.subname = ""  // 入力域をクリア
                                
                                
                            }
                        }//編集中に関する処理終了
         
                        
                        
                        //リターンキー処理終了
                        
                    )//テキストフィールド終了
                    
                    //テキストフィールドに関する設定
                        .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                        
                        // 編集フラグがONの時に枠に影を付ける
                        .shadow(color: subeditting ? .blue : .clear, radius: 3)
                    //設定終了
                    
        
                
                HStack{
                    Text("教室")
                    Spacer()
                    Text(ClassNo[Dselection*5+Jselection])//②
                    
                }
                    TextField("教室を入力して下さい", text: $clname,
                              
                        onEditingChanged: { begin in
                            
                            if begin {
                                self.cleditting = true
                                self.ClassNo[Dselection*5+Jselection] = ""
                                    
                                
                            }
                            else {
                                self.cleditting = false
                                self.ClassNo[Dselection*5+Jselection] = "\(self.clname)"
                                self.clname = ""
                                
                                
                            }
                        }
                    )//テキストフィールド終了
                    
                    //テキストフィールドに関する設定
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        .shadow(color: cleditting ? .blue : .clear, radius: 3)
                    //設定終了
                
                
                
                
            }
            
            
            
           
            .navigationBarTitle("時間割の編集")
        }
    }
}

struct TableEditView_Previews: PreviewProvider {
    static var previews: some View {
        TableEditView()
    }
}
