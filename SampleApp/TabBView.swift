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
    
        HStack{
            Text("テキスト")
        
            if self.TaskPoint.Point >= 2{
                Image(systemName: "minus.circle")
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
