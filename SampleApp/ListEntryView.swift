//
//  ListEntryView.swift
//  SampleApp
//
//  Created by kana on 2021/03/24.
//

import SwiftUI

struct ListEntryView: View {
    @State var number = 0
    var body: some View {

        Text("リストを分けるかどうか迷っています")
        Text("日付を設定できるようにしたい")
        
    }
}


struct ListEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ListEntryView()
   }
}
