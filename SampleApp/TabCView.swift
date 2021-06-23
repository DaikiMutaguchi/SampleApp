//
//  TabCView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//
import SwiftUI

struct TabCView: View {
    
    let Youbi = ["月" , "火" , "水" , "木" , "金"]
    @EnvironmentObject var CSubTitle: SjAndCn //クラスSjAndCnから変数を作成
    @EnvironmentObject var CClassNo: SjAndCn  //クラスSjAndCnから変数を作成
    @State private var isShowingEditSheet: Bool = false
    
    var body: some View {
        //ナビゲーションビューの開始
        NavigationView  {
            
            ZStack{ // 背景色指定
                Color(red: 0.88, green: 0.96, blue:1.0).edgesIgnoringSafeArea(.all)
                
            
        ScrollView(.vertical, showsIndicators: false) { //縦画面サイズ調整(iPhone 8用)
            
            Spacer()
            Spacer()
           
            
            //横に下のVStack①を並べる
            HStack{
                
                ForEach((0...4), id: \.self) { Date in //Vstack①を横に５回表示、0=月、4=金
                        
                 
                    VStack{  //下のZStack①と②を縦に表示
                        
                        
                        ZStack { //Zstack①、曜日のマスを表示
                            Image("Youbi")
                                .resizable()
                                .frame(width: 65, height: 20)
                            Text(Youbi[Date]) .foregroundColor(.white)//配列Youbiの0~4番めの値表示
                    
                        }
                        
                        
                        ForEach((0...4), id: \.self) { time in
                            
                            
                            //Zstack②を縦に5コマ表示させる
                            
                            //ナビゲーションリンクの開始（アウト）
                            //NavigationLink(destination:TBDataView()){
                            
                            ZStack {//Zstack②
                                
                                
                                Button(action:{
                                    self.isShowingEditSheet = true
                                    
                                })
                                {
                                    Image("TbBG")
                                            .resizable()
                                            .frame(width: 65, height: 100)

                                }
                                .sheet(isPresented: $isShowingEditSheet)
                                {
                                    TableEditSheet(isShowingEditSheet: self.$isShowingEditSheet)
                                }
                                
                                
                                
                                
                                
                                
                                VStack{
                                    
                                Text(CSubTitle.SubTitle[Date*5+time])
                                    .fontWeight(.semibold)
                                    .frame(width: 65, height:80 , alignment: .center)  // フレームの設定
                                // .border(Color.red, width: 2)   // フレームに枠線をつけて可視化（アウト済）
                                    
                                    
                             
                                Text(CClassNo.ClassNo[Date*5+time])
                                   .frame(width: 65, height:20 ,  alignment: .center )  // フレームの設定
                               //  .border(Color.green, width: 2) //枠線の可視化（アウト済）
                                    
                                } //VStackの科目名、教室名テキスト配置終了
                                
                            } //1コマ分のマス設定終了
                                
                                
                         //   }//ナビゲーションリンク終了
                        }//５コマ表示ループ終了
                    }//各曜日Vstack終了
                        
                }//５曜日分ループ終了
                    
            }//HStack終了
            
        }//スクロールビュー終了
            }// 背景色用
        .navigationBarTitle("My時間割") //ナビゲーションバーにタイトル設定
        
        .toolbar { //バーにアイコンを設定
                ToolbarItem(placement: .navigationBarTrailing){  //アイテムをバーの右側に配置
                   
                    NavigationLink(destination:SubMemoView()){ //↓のアイコンにナビゲーションリンクを設定
                        
                        Image(systemName: "note.text")   //アイコンの設定
                    }
                }
            
            ToolbarItem(placement: .navigationBarTrailing){  //アイテムをバーの右側に配置
                NavigationLink(destination:TableEditView()){ //↓のアイコンにナビゲーションリンクを設定
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")   //アイコンの設定
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
            .environmentObject(SjAndCn())  //このビューでクラスSjAndCnにあるグローバル変数の使用を記入
    }
}
