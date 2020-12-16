//
//  TableTab.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2020/12/16.
//

import SwiftUI

struct TabBView: View {
    var body: some View {
        Image("Obake.png")
            .resizable()
            .frame(width: 420.0, height: 800.0, alignment: .leading)
    }
}

struct TabBView_Previews: PreviewProvider {
    static var previews: some View {
        TabBView()
    }
}
