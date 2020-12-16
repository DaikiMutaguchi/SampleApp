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
            List(1..<10) { index in
                            NavigationLink(destination: Text("\(index)番目のView")) {
                                Text("\(index)行目")
                            }
                        }.navigationTitle("Aのタブだよ")
            }
        }
    }

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
