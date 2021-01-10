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
            .resizable()//画像をフレームの大きさに合わせる
            .frame(width: 380.0, height: 700.0, alignment: .leading)
                    //フレームサイズの指定
    }
}

struct TabBView_Previews: PreviewProvider {
    static var previews: some View {
        TabBView()
    }//TabBViewシミュレーター
}
