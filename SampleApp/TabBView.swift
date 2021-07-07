//
//  TableTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabBView: View {
    let GetPoint = [1,3,5,10,15,20,25,30,40,50,60,70,80,90,100,150,200,300,400,500,]
    
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
                    Image("IMG_0461")
                        .resizable()
                        .frame(width: 400, height: 200)
                }
                
                
        HStack(spacing: 5) {
                    
            ZStack{ //おばけ開始
                        
                Button(action:{ //モノクロのおばけ画像ボタン
                    self.ObakePoint.Obake = 0
                    self.isShowingSheet = true
                        })
                        {
                            Image("Obake1m")
                                .resizable()
                                .frame(width: 200, height: 200)
                }
                        .sheet(isPresented: $isShowingSheet)
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            } // モノクロ設定終了
            
                if self.TaskPoint.Point >= 1{ //カラー画像
                        Button(action:{
                            self.ObakePoint.Obake = 1
                            self.isShowingSheet = true
                                })
                            {
                                Image("Obake1")
                                    .resizable()
                                    .frame(width: 200, height: 200)
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
                            Image("Obake2m")
                                .resizable()
                                .frame(width: 200, height: 200)
                }
                        .sheet(isPresented: $isShowingSheet)
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            } // モノクロ設定終了
            
                if self.TaskPoint.Point >= 2{ //カラー画像
                        Button(action:{
                            self.ObakePoint.Obake = 2
                            self.isShowingSheet = true
                                })
                            {
                                Image("Obake2")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                            }
                                    .sheet(isPresented: $isShowingSheet)
               
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            }
                        }//カラー画像終了
                        
                    }//おばけ終了
                
            }//HStack終了
                
                
                HStack(spacing: 5) {
                            
                    ZStack{ //おばけ開始
                                
                        Button(action:{ //モノクロのおばけ画像ボタン
                            self.ObakePoint.Obake = 0
                            self.isShowingSheet = true
                                })
                                {
                                    Image("Obake3m")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                        }
                                .sheet(isPresented: $isShowingSheet)
                                    {
                                        SheetView(isShowingSheet: self.$isShowingSheet)
                                    } // モノクロ設定終了
                    
                        if self.TaskPoint.Point >= 3{ //カラー画像
                                Button(action:{
                                    self.ObakePoint.Obake = 3
                                    self.isShowingSheet = true
                                        })
                                    {
                                        Image("Obake3")
                                            .resizable()
                                            .frame(width: 200, height: 200)
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
                                    Image("Obake4m")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                        }
                                .sheet(isPresented: $isShowingSheet)
                                    {
                                        SheetView(isShowingSheet: self.$isShowingSheet)
                                    } // モノクロ設定終了
                    
                        if self.TaskPoint.Point >= 4{ //カラー画像
                                Button(action:{
                                    self.ObakePoint.Obake = 4
                                    self.isShowingSheet = true
                                        })
                                    {
                                        Image("Obake4")
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                    }
                                            .sheet(isPresented: $isShowingSheet)
                       
                                    {
                                        SheetView(isShowingSheet: self.$isShowingSheet)
                                    }
                                }//カラー画像終了
                                
                            }//おばけ終了
                        
                    }//HStack終了
        
            
        
            
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
