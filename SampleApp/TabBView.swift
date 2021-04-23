//
//  TableTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabBView: View {
    @EnvironmentObject var TaskPoint: SjAndCn //タスク完了で得られるポイント
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
        ZStack{
            Image("TbBG")
        VStack{
            Text("今は\(TaskPoint.Point)")
        
            if self.TaskPoint.Point >= 0{
                Image("1E93370C-DA49-4A0A-A3EE-0DD87567F2B5")
                    .resizable()
                    .frame(width: 400, height: 300)
            }
            
            if self.TaskPoint.Point >= 1{
                Image("9923C1AB-D9F8-471B-9E8E-801677D4E3B0")
                    .resizable()
                    .frame(width: 400, height: 300)
            }
            
            if self.TaskPoint.Point >= 2{
                Image("9923C1AB-D9F8-471B-9E8E-801677D4E3B0")
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
