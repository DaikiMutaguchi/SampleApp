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
        
        Text("\(self.TaskPoint.Point)")
    }
}

struct TabBView_Previews: PreviewProvider {
    static var previews: some View {
        TabBView()
            .environmentObject(SjAndCn())
    }//TabBViewシミュレーター
}
