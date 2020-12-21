//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
       @State var alist: [String] = []
       @State var newalist = ""   //入力してもらう
       var body: some View {
        
        NavigationView{
           VStack(alignment: .leading) {
            
               VStack(alignment: .leading) {
                   Text("課題をリストに追加しよう！")
                       .font(.footnote)
                       .foregroundColor(.gray)
                
                   HStack {
                       TextField("ToDoを入力", text: $newalist).textFieldStyle(RoundedBorderTextFieldStyle())
                    
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
                   .onDelete(perform: self.deleteRow)
               }
           }
           .navigationTitle("ToDoリスト")
            
            }
       }
        func deleteRow(offsets: IndexSet) {
                self.alist.remove(atOffsets: offsets)
            }
    }
struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}


