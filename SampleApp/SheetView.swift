//
//  SheetView.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/06/22.
//

import SwiftUI

//１個目
struct SheetView1: View {
    @Binding var isShowingSheet1 : Bool
    var body: some View {
        Button(action:{
                self.isShowingSheet1 = false
               })  {
            Text("閉じる")
        }
        Text("おばけ情報1ページめ")
    }
}

//2個目
struct SheetView2: View {
    
    @Binding var isShowingSheet2 : Bool
    var body: some View {
        
        Button(action:{
                self.isShowingSheet2 = false
               
        })  {
            Text("閉じる")
        }
        Text("おばけ情報２ページめ")
            }
}
