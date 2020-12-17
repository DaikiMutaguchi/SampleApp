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
            List(0 ..< 5) { item in
                NavigationLink(destination: Text("Destination")/*@END_MENU_TOKEN@*/) { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Navigate") }
                
            }.navigationTitle("時間割表示したい")
        }
    }
}

struct TabCView_Previews: PreviewProvider {
    static var previews: some View {
        TabCView()
    }
}
