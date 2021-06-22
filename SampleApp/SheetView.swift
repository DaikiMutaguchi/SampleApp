//
//  SheetView.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/06/22.
//

import SwiftUI

//１個目
struct SheetView: View {
    @Binding var isShowingSheet : Bool
    @EnvironmentObject var ObakePoint: SjAndCn
    
    var body: some View {
        Button(action:{
                self.isShowingSheet = false
               })  {
            Text("閉じる")
        }
        Text("おばけ情報\(self.ObakePoint.Obake)ページめ")
        
    }
}

