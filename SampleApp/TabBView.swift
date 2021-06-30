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
             
                if self.TaskPoint.Point >= 0{
                    Image("IMG_0461")
                        .resizable()
                        .frame(width: 400, height: 200)
                }
                
                
        HStack(spacing: 5) {
                    
            ZStack{
                        
                Button(action:{
                    self.ObakePoint.Obake = 0
                    self.isShowingSheet = true
                        })
                        {
                            Image("IMG_0460m")
                                .resizable()
                                .frame(width: 200, height: 200)
                        
                }
                        .sheet(isPresented: $isShowingSheet)
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            }
            
                if self.TaskPoint.Point >= 1{
                    Button(action:{
                        self.ObakePoint.Obake = 1
                        self.isShowingSheet = true
                            })
                        {
                            Image("IMG_0460")
                                .resizable()
                                .frame(width: 200, height: 200)
                        }
                            .sheet(isPresented: $isShowingSheet)
               
                    
                            {
                                SheetView(isShowingSheet: self.$isShowingSheet)
                            }
                        }//カラー画像
                        
                    }//ZStack
                    
                    
                    
            ZStack{
                        
                Button(action:{
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
                            }
            
                if self.TaskPoint.Point >= 2{
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
                        }//カラー画像
                        
                    }//ZStack
                
            }//HStack終了
                
                
                HStack{
            if self.TaskPoint.Point >= 3{
                Image("IMG_0460")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            if self.TaskPoint.Point >= 4{
                Image("IMG_0460")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
                
            }
        
            
        
            
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
