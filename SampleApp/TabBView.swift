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
                
                
                HStack{
            if self.TaskPoint.Point >= 1{
                Image("IMG_0460")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            if self.TaskPoint.Point >= 2{
                Image("IMG_0460")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
                
            }
                
                
                HStack{
            if self.TaskPoint.Point >= 3{
                Image("IMG_0460")
                    .resizable()
                    .frame(width: 180, height: 180)
            }
            if self.TaskPoint.Point >= 4{
                Image("IMG_0460")
                    .resizable()
                    .frame(width: 180, height: 180)
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
