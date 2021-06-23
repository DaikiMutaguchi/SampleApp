//
//  TableEditSheet.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/06/24.
//

import SwiftUI

struct TableEditSheet: View {
    let Youbi = ["月","火","水","木","金"] //タイトル部分の科目名
    
    
    @EnvironmentObject var ESubTitle: SjAndCn    //クラスSjAndCnから、変数ESubJectを設定
    @EnvironmentObject var EClassNo: SjAndCn    //クラスSjAndCnから、変数EClassNoを設定
    @EnvironmentObject var EMemo: SjAndCn    //クラスSjAndCnから、変数ESubJectを設定
    
    @State private var Dselection = 5   //Pickerで選んだ配列Dateの要素番号が代入される。初期値は５の（未選択）
    @State private var Jselection = 5   //Pickerで選んだ配列Jikanの要素番号が代入される。初期値は５の（未選択）
    @State var subname : String = ""
    @State var subeditting = false      //科目名のテキストフィールドを編集しているかどうか
    
    @State var clname : String = ""
    @State var cleditting = false      //教室名のテキストフィールドを編集しているかどうか
    
    @State var Memoname : String = ""
    @State var Memoeditting = false      //科目名のテキストフィールドを編集しているかどうか
    
    
    @State private var Flag = false
    
    @State private var Delete : String = ""
    
    @Binding var isShowingEditSheet : Bool
    @EnvironmentObject var ObakePoint: SjAndCn
    
    @EnvironmentObject var TimeTable: SjAndCn
    
    func MemoDelete(){
        self.EMemo.Memo[Dselection*5+Jselection] = ""
    }
    
    var body: some View {
     
       
            Text(Youbi[TimeTable.Table/5]+"曜日"+"\(TimeTable.Table%5+1)限")
                .font(.system(size: 50, weight: .black, design: .rounded))
        
            Form { //フォームの開始
                
                HStack{    //科目名表示
                    Text("科目")
                    Spacer()
                    Text(ESubTitle.SubTitle[TimeTable.Table])    //グローバル変数の項目を表示
                        .font(.system(.headline, design: .rounded))    //文字の太さ：ヘッドライン、書体：ゴシック体
                }    //科目名表示終了
                
                
                
                TextField("科目名を入力して下さい", text: $subname, //科目名テキストフィールド
                              
                        onEditingChanged: { begin in//編集中に関する処理開始
                            if begin {    //入力処理中ならばifを実行
                                self.subeditting = true    // 編集フラグをオン
                                self.ESubTitle.SubTitle[TimeTable.Table] = ""       // ↑の科目名表示をクリア
                            }
                            
                            else {
                                self.subeditting = false   // 編集フラグをオフ
                                self.ESubTitle.SubTitle[TimeTable.Table] = "\(self.subname)"   // 入力した内容を↑の科目名へ表示
                                self.subname = ""  // 入力域をクリア
                            }
                        }//編集中に関する処理終了
                        
                )//テキストフィールド終了
                //テキストフィールドに関する設定
                .textFieldStyle(RoundedBorderTextFieldStyle())     // 入力域を枠で囲む
                .shadow(color: subeditting ? .blue : .clear, radius: 3)     // 編集フラグがONの時に枠に影を付ける
                //設定終了
                    
        
                
                HStack{    //教室名表示
                    Text("教室")
                    Spacer()
                    Text(EClassNo.ClassNo[TimeTable.Table])
                        .font(.system(.headline, design: .rounded))
                    
                }    //教室名表示終了
                
                
                TextField("教室を入力して下さい", text: $clname,
                              
                        onEditingChanged: { begin in
                            
                            if begin {
                                self.cleditting = true
                                self.EClassNo.ClassNo[TimeTable.Table] = ""
                            }
                            else {
                                self.cleditting = false
                                self.EClassNo.ClassNo[TimeTable.Table] = "\(self.clname)"
                                self.clname = ""
                            }
                        }
                )//テキストフィールド終了
                //テキストフィールドに関する設定
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: cleditting ? .blue : .clear, radius: 3)
                //設定終了
                
                
                Toggle(isOn:$Flag) {
                                Text("授業メモの追加／編集")
                                
                }
                if Flag {
                
                Text(EMemo.Memo[TimeTable.Table])
                    .font(.system(.headline, design: .rounded))
                    
                TextField("１５文字以内で入力", text: $Memoname,
                              
                        onEditingChanged: { begin in
                            
                            if begin {
                                self.Memoeditting = true
                                self.EMemo.Memo[TimeTable.Table] = ""
                            }
                            else {
                                self.Memoeditting = false
                                self.EMemo.Memo[TimeTable.Table] = "\(self.Memoname)"
                                self.Memoname = ""
                            }
                        }
                )//テキストフィールド終了
                //テキストフィールドに関する設定
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: Memoeditting ? .blue : .clear, radius: 3)
               .disabled(!Flag)
                //設定終了
                
                
                }
                
                
                    
                
                
                  
                
                
        
        
            }//form
        
        
        
        
        Button(action:{
                self.isShowingEditSheet = false
               })  {
            Text("閉じる")
        }
        
    
    }//body
}
