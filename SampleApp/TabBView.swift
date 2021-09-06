//
//  TableTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabBView: View {
    
    @EnvironmentObject var CP: Obakeinfo
    @EnvironmentObject var TaskPoint: SjAndCn //タスク完了で得られるポイント
    @State private var isShowingSheet: Bool = false
    @EnvironmentObject var ObakePoint: SjAndCn
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
        ZStack(alignment: .top){
            Image("TbBG")
                .resizable()
                .frame(width: 400, height: 800)
            
           
            VStack{
             
                if self.TaskPoint.Point >= 0{ //タイトル画像
                    Image("Obakehead")
                        .resizable()
                        .padding(.top,10)
                        .frame(width: 390, height:200)
                
       
                
                
                
    ForEach((1...10), id: \.self) { LP in
                
        HStack(spacing: 5) {
                    
            ZStack{ //おばけ開始
                        
                Button(action:{ //モノクロのおばけ画像ボタン
                    self.ObakePoint.Obake = 0
                    self.isShowingSheet = true
                        })
                        {
                            Image("Obake\((LP * 2)-1)m")
                                .resizable()
                                .frame(width: 180, height: 180)
                                .cornerRadius(30)
                              
                          //      .border(Color.red)
                }
                        .sheet(isPresented: $isShowingSheet)
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            } // モノクロ設定終了
            
                if self.TaskPoint.Point >= ((LP * 2)-1) * 5{ //カラー画像
                        Button(action:{
                            self.ObakePoint.Obake = (LP * 2)-1
                            self.isShowingSheet = true
                                })
                            {
                                Image("Obake\((LP * 2)-1)")
                                    .resizable()
                                    .frame(width: 180, height: 180)
                                    .cornerRadius(30)
                                   
                               //     .border(Color.red)
                            }
                                    .sheet(isPresented: $isShowingSheet)
               
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            }
                        }//カラー画像終了
                        
                    }//おばけ終了
                    
            
            ZStack{ //おばけ開始
                        
                Button(action:{ //モノクロのおばけ画像ボタン
                    self.ObakePoint.Obake = 0
                    self.isShowingSheet = true
                        })
                        {
                            Image("Obake\(LP * 2)m")
                                .resizable()
                                .frame(width: 180, height: 180)
                                .cornerRadius(30)
                            //  .border(Color.red)
                }
                        .sheet(isPresented: $isShowingSheet)
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            } // モノクロ設定終了
            
                if self.TaskPoint.Point >= LP * 2 * 5{ //カラー画像
                        Button(action:{
                            self.ObakePoint.Obake = LP * 2
                            self.isShowingSheet = true
                                })
                            {
                                Image("Obake\(LP * 2)")
                                    .resizable()
                                    .frame(width: 180, height: 180)
                                    .cornerRadius(30)
                            //     .border(Color.red)
                            }
                                    .sheet(isPresented: $isShowingSheet)
               
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            }
                        }//カラー画像終了
                        
                    }//おばけ終了
                
            }//HStack終了
        
    }//ループ終了
                    
                    
                    
        HStack {          // ポイントカウント
            Text("\(TaskPoint.Point)")
            Text("ポイント獲得")
            
           
            
        }
        
    }//VStack
                
                
    //ループ終了
        
            
        
            
        }
        }
    }
        
        
}
    
    

struct TabBView_Previews: PreviewProvider {
    static var previews: some View {
        TabBView()
            .environmentObject(SjAndCn())
    }//TabBViewシミュレーター
}
}

