//
//  TabCView.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabCView: View {
    var body: some View {
           NavigationView {
               NavigationLink(destination: TabAView()) {
                
                HStack{
                   ZStack {
                       Image("TbBG")
                           .resizable()
                           .frame(width: 70, height: 130)
                        Text("演習")
                    
                    
                   }
                    
                    ZStack {
                        Image("TbBG")
                            .resizable()
                            .frame(width: 70, height: 130)
                         Text("演習")
                     
                     
                    }
                    
                }
               }
                   .navigationTitle("My時間割")
           }
       }
    
}

struct TabCView_Previews: PreviewProvider {
    static var previews: some View {
        TabCView()
    }
}
