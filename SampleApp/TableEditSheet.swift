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
    
    @State var subname : String = ""
    @State var subeditting = false      //科目名のテキストフィールドを編集しているかどうか
    
    @State var clname : String = ""
    @State var cleditting = false      //教室名のテキストフィールドを編集しているかどうか
    
    @State var Memoname : String = ""
    @State var Memoeditting = false      //科目名のテキストフィールドを編集しているかどうか
    
    @EnvironmentObject var Flag: SjAndCn
    @State private var Delete : String = ""
    
    @Binding var isShowingEditSheet : Bool
    @EnvironmentObject var ObakePoint: SjAndCn
    @EnvironmentObject var TimeTable: SjAndCn
    
    @EnvironmentObject var SubMemo: SjAndCn //クラスSjAndCnから変数を作成
    @EnvironmentObject var MAb: SjAndCn //クラスSjAndCnから変数を作成
    
    
    
    func MemoDelete(){
        self.EMemo.Memo[TimeTable.Table] = ""
    }
    
    
    
    var body: some View {
        ZStack{ // 背景色指定
            Color(red: 0.88, green: 0.96, blue:1.0).edgesIgnoringSafeArea(.all)
            
            VStack{
    
                Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                    .padding(30)
                
            Text(Youbi[TimeTable.Table/5]+"曜日"+"\(TimeTable.Table%5+1)限")
                .font(.system(size: 50, weight: .black, design: .rounded))
                .foregroundColor(Color.init(red: 0.12, green: 0.20, blue: 0.70))
            
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
                        
                )   .textFieldStyle(RoundedBorderTextFieldStyle())     // 入力域を枠で囲む
                    .shadow(color: subeditting ? .blue : .clear, radius: 3)     // 編集フラグがONの時に枠に影を付ける
              
                                    
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
                ) .textFieldStyle(RoundedBorderTextFieldStyle())
                  .shadow(color: cleditting ? .blue : .clear, radius: 3)
             
                
                
                Toggle(isOn:$Flag.Flag[TimeTable.Table]) {
                    Text("授業メモの追加／編集")
                                
                }
              
                if Flag.Flag[TimeTable.Table] {
                
                    Text(EMemo.Memo[TimeTable.Table])
                        .font(.system(.headline, design: .rounded))
                    TextField("メモを入力して下さい", text: $Memoname,
                              
                    
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
                    ) .textFieldStyle(RoundedBorderTextFieldStyle())
                      .shadow(color: Memoeditting ? .blue : .clear, radius: 3)
                      .disabled(!Flag.Flag[TimeTable.Table])
     
                
                }
                
                
                HStack{
               
                    if self.MAb.Absence[TimeTable.Table] >= 5{
                        Text("欠席回数：\(MAb.Absence[TimeTable.Table])")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.red)
                    }
                    
                    else if self.MAb.Absence[TimeTable.Table] >= 3{
                        Text("欠席回数：\(MAb.Absence[TimeTable.Table])")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.orange)
                    }
                    
                    else{
                        Text("欠席回数：\(MAb.Absence[TimeTable.Table])")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)
                    }
                Spacer()
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    
                    .onTapGesture {
            
                        self.MAb.Absence[TimeTable.Table] += 1
                        UIImpactFeedbackGenerator(style: .medium)
                            .impactOccurred()
                                    }
                    .disabled(MAb.Absence[TimeTable.Table]>=15)
                
                Image(systemName: "minus.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    
                    .onTapGesture {
                        self.MAb.Absence[TimeTable.Table] -= 1
                        UIImpactFeedbackGenerator(style: .medium)
                        .impactOccurred()
                    }
                    .disabled(MAb.Absence[TimeTable.Table]<=0)
                   
                
                
                    
                }
                
            }//form
        
                
            VStack{
                if self.subeditting == true || self.cleditting == true{
                    Text("確定を押して下さい")
                }
            
                Button(action:{
                    self.isShowingEditSheet = false
                    }){
                    Text("閉じる")
                    }
                    .disabled(self.subeditting == true||self.cleditting == true )
                   
                
            }//VStack
            
            
                
        }//VStack
        }//ZStack
    }//body
}//View
