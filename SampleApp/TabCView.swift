//
//  TabCView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabCView: View {
    let Youbi = ["月" , "火" , "水" , "木" , "金"]
    //var SubTitle: [String] = Array(repeating: "未登録", count: 26)//String型の配列を２６要素設定し、「未登録」で初期化
    @EnvironmentObject var CSubTitle: SjAndCn
    @EnvironmentObject var CClassNo: SjAndCn
    
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
                        
                        
                        ForEach((0...4), id: \.self) { time in
                            
                            
                            //Zstack②を縦に5コマ表示させる
                            
                            //ナビゲーションリンクをコメントアウトしておく
                            //NavigationLink(destination:TBDataView()){
                            
                            ZStack {//Zstack②
                                Image("TbBG")
                                        .resizable()
                                        .frame(width: 65, height: 100)
                                VStack{
                                    Text(CSubTitle.SubTitle[Date*5+time])
                                Text(CClassNo.ClassNo[Date*5+time])
                                }
                                
                            }
                                
                                
                         //   }//ナビゲーションリンク終了
                        }//５コマ表示ループ終了
                    }//各曜日Vstack終了
                        
                }//５曜日分ループ終了
                    
            }//HStack終了
            
        }//スクロールビュー終了
        .navigationBarTitle("My時間割")
       
                   
                   .toolbar {
                      /// ナビゲーションバー右２
                       ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination:TableEditView()){
                           Image(systemName: "square.and.pencil")
                       }
                       }
                       
                           }
        }//ナビゲーションビュー終了
        
    }//body終了
}//TabCView終了
    

//TabCVIewプレビュー
struct TabCView_Previews: PreviewProvider {
    static var previews: some View {
        TabCView()
            .environmentObject(SjAndCn())
    }
}
