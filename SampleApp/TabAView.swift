//
//  ListTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabAView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 10) { item in
                NavigationLink(destination: Text("Destination")/*@END_MENU_TOKEN@*/) { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Navigate") }
                
            }.navigationTitle("Aのタブだよ")
        }
    }
}

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
