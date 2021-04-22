//
//  ListEntryView.swift
//  SampleApp
//
//  Created by kana on 2021/03/24.
//

import SwiftUI

struct ListEntryView: View {
    var body: some View {
        NavigationView{
            
            VStack{
            Text("構成迷い中")
            Text("")
            Text("1.リスト表示部と登録部を分けるかどうか")
            Text("2.日付をどう入れるか→熟成")
            Text("3.単なる削除と課題達成のための削除との差別化")
            }
        }
    }
}



struct ListEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ListEntryView()
   }
}
