//
//  SubMemoView.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/02/27.
//
import SwiftUI

struct SubMemoView: View {
    
    let Youbi = ["月曜日" , "火曜日" , "水曜日" , "木曜日" , "金曜日"]
    @EnvironmentObject var SubMemo: SjAndCn //クラスSjAndCnから変数を作成
    
    var body: some View {
        List {
            ForEach((0...4), id: \.self) { Date in
                
                Section(header: Text(Youbi[Date])){
                    ForEach((0...4), id: \.self) { time in
                        
                        //１行目の設定
                        Text("\(time+1)限：\(SubMemo.Memo[Date*5+time])")
                        
                        //２行目の設定
                        HStack{
                        //
                        Text("欠席回数：")
                        Button(action: {
                                        //アクション
                                }) {
                                    Image(systemName: "plus.circle")   // プラスアイコンを指定
                                }
                        Button(action: {
                                        //アクション
                                }) {
                                    Image(systemName: "minus.circle")   // マイナスアイコンを指定
                                }
                        }
                }
            }
        }
        .listStyle(SidebarListStyle())// Listの表示スタイル指定
        .navigationBarTitle("授業メモ")
    }
}

struct SubMemoView_Previews: PreviewProvider {
    static var previews: some View {
        SubMemoView()
            .environmentObject(SjAndCn())
    }
}
}
