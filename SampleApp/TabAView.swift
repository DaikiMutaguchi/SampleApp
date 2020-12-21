//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
       @State var alist: [String] = []
       @State var newalist = "alist"   //入力してもらうとこ
       var body: some View {
           VStack(alignment: .leading) {
               VStack(alignment: .leading) {
                   Text("リスト一覧に追加する")
                       .font(.footnote)
                       .foregroundColor(.gray)
                   HStack {
                       TextField("ToDoを入力する", text: $newalist).textFieldStyle(RoundedBorderTextFieldStyle())
                       Button(action: {
                           self.alist.append(self.newalist)
                           self.newalist = ""
                       }) {
                           Text("Done")
                               .buttonStyle(BorderlessButtonStyle())
                       }
                   }
               }.padding([.leading, .trailing])
               
               List {
                   ForEach(alist, id: \.self) { user in
                       Text(user)
                   }
               }
           }
       }
    }
struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}


