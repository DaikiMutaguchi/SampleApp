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
    @EnvironmentObject var TimeTable: SjAndCn
    
    var body: some View {
        ZStack{ // 背景色指定
            Color(red: 0.88, green: 0.96, blue:1.0).edgesIgnoringSafeArea(.all)
        ScrollView(.vertical, showsIndicators: false) { //縦画面サイズ調整(iPhone 8用)
            VStack(alignment: .leading){
                Text("My時間割")
                    .font(.system(size: 40, weight: .black))
                    .padding(15)
                    .foregroundColor(Color.init(red: 0.12, green: 0.20, blue: 0.70))
                
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
                ZStack {//Zstack②
                    Button(action:{
                        self.isShowingEditSheet = true
                        self.TimeTable.Table = Date*5+time
                        UIImpactFeedbackGenerator(style: .medium)
                            .impactOccurred()
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
                            
                            Text(CClassNo.ClassNo[Date*5+time])
                                .frame(width: 65, height:20 ,  alignment: .center )  // フレームの設定
                            
                                } //VStackの科目名、教室名テキスト配置終了
                                
                            } //ZStack②
                                
                    }//５コマ表示ループ終了
                        }//各曜日Vstack終了
                    }//５曜日分ループ終了
                }//HStack終了
            }//VStack
        }//スクロールビュー
    } //ZStack
}//body終了
}//TabCView終了
    

struct TabCView_Previews: PreviewProvider {
    static var previews: some View {
        TabCView()
            .environmentObject(SjAndCn())  //このビューでクラスSjAndCnにあるグローバル変数の使用を記入
    }
}
