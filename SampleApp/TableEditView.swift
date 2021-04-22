//
//  TableEditView.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/02/26.
//

import SwiftUI



struct TableEditView: View {
    let Date = ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日" , "(選択して下さい)"] //Pickerの項目を設定
    let Jikan = ["ダミー","１限","２限","３限","４限","５限" , "(選択して下さい)"]    //Pickerの項目を設定
    
    
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
    
    func MemoDelete(){
        self.EMemo.Memo[Dselection*5+Jselection] = ""
    }
    
    var body: some View {
        NavigationView {    // Formで使う場合はNavigationViewが必須
            
            //Form{ ここをフォームにするのかListにするのかで表示が変わる
            List {   //フォームの開始
                Picker(selection: $Dselection, label: Text("曜日")) {  //曜日選択のためのPicker
                    ForEach(0 ..< Date.count) { num1 in  //配列Dateの０番目の要素からピッカーに表示
                        Text(self.Date[num1])  //ピッカーで選択したら、選択した項目を表示する
                    }    //ループ終了
                }    //曜日選択ピッカー終了
                
                Picker(selection: $Jselection, label: Text("時間")) {    //時限の設定のPicker
                    ForEach(1 ..< Jikan.count) { num2 in
                        Text(self.Jikan[num2])
                    }    //ループ終了
                }    //時限設定Picker終了
                
                
                HStack{    //科目名表示
                    Text("科目")
                    Spacer()
                    Text(ESubTitle.SubTitle[Dselection*5+Jselection])    //グローバル変数の項目を表示
                        .font(.system(.headline, design: .rounded))    //文字の太さ：ヘッドライン、書体：ゴシック体
                }    //科目名表示終了
                
                
                
                TextField("科目名を入力して下さい", text: $subname, //科目名テキストフィールド
                              
                        onEditingChanged: { begin in//編集中に関する処理開始
                            if begin {    //入力処理中ならばifを実行
                                self.subeditting = true    // 編集フラグをオン
                                self.ESubTitle.SubTitle[Dselection*5+Jselection] = ""       // ↑の科目名表示をクリア
                            }
                            
                            else {
                                self.subeditting = false   // 編集フラグをオフ
                                self.ESubTitle.SubTitle[Dselection*5+Jselection] = "\(self.subname)"   // 入力した内容を↑の科目名へ表示
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
                    Text(EClassNo.ClassNo[Dselection*5+Jselection])
                        .font(.system(.headline, design: .rounded))
                    
                }    //教室名表示終了
                
                
                TextField("教室を入力して下さい", text: $clname,
                              
                        onEditingChanged: { begin in
                            
                            if begin {
                                self.cleditting = true
                                self.EClassNo.ClassNo[Dselection*5+Jselection] = ""
                            }
                            else {
                                self.cleditting = false
                                self.EClassNo.ClassNo[Dselection*5+Jselection] = "\(self.clname)"
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
                
                Text(EMemo.Memo[Dselection*5+Jselection])
                    .font(.system(.headline, design: .rounded))
                    
                TextField("１５文字以内で入力", text: $Memoname,
                              
                        onEditingChanged: { begin in
                            
                            if begin {
                                self.Memoeditting = true
                                self.EMemo.Memo[Dselection*5+Jselection] = ""
                            }
                            else {
                                self.Memoeditting = false
                                self.EMemo.Memo[Dselection*5+Jselection] = "\(self.Memoname)"
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
                
                
                    
                
                
                  
                
                
            }//フォームの終了
            
            .navigationBarTitle("時間割の編集")
        }    // フォーム用ナビゲーションリンク終了
    }    //body
}    //View

struct TableEditView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TableEditView()
                .environmentObject(SjAndCn())    //ここでもグローバル変数を使うことを宣言
        }
    }
}
