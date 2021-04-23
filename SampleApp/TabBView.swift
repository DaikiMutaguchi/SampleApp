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
            
        ZStack{
            Image("TbBG")
                .resizable()
                .frame(width: 400, height: 800)
        
            
            
            
            
            
           
            VStack{
                    
             
                if self.TaskPoint.Point >= 0{
                    Image("1E93370C-DA49-4A0A-A3EE-0DD87567F2B5")
                        .resizable()
                        .frame(width: 400, height: 300)
                }
            if self.TaskPoint.Point >= 1{
                Image("1E93370C-DA49-4A0A-A3EE-0DD87567F2B5")
                    .resizable()
                    .frame(width: 400, height: 300)
            }
            if self.TaskPoint.Point >= 2{
                Image("1E93370C-DA49-4A0A-A3EE-0DD87567F2B5")
                    .resizable()
                    .frame(width: 400, height: 300)
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
