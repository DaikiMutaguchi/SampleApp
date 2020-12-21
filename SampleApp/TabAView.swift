//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
       @State var messages: [String] = []
       @State var newMessage = ""
       var body: some View {
           VStack(alignment: .leading) {
               VStack(alignment: .leading) {
                   Text("リスト一覧に追加する")
                       .font(.footnote)
                       .foregroundColor(.gray)
                   HStack {
                       TextField("ToDoを入力する", text: $newMessage).textFieldStyle(RoundedBorderTextFieldStyle())
                       Button(action: {
                           self.messages.append(self.newMessage)
                           self.newMessage = ""
                       }) {
                           Text("Done")
                               .buttonStyle(BorderlessButtonStyle())
                       }
                   }
               }.padding([.leading, .trailing])
               
               List {
                   ForEach(messages, id: \.self) { user in
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


