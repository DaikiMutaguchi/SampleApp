//
//  CheckBox.swift
//  SampleApp
//
//  Created by kana on 2021/05/09.
//

import SwiftUI

struct CheckBox: View {
    // 切り替える状態（初期値はfalse）
    @State private var isChecked = false
    
    // チェックボックスの表示
    var body: some View {
        HStack{
        Button(action: toggle) {
            if(isChecked) {
                Image(systemName: "checkmark.square.fill")
            .foregroundColor(.green)
            } else {
                Image(systemName: "square")
            }
        }
        Text("見てみて")
        }
    }
    
    // タップ時の状態の切り替え
    func toggle() -> Void {
        isChecked = !isChecked
        UIImpactFeedbackGenerator(style: .medium)
        .impactOccurred()
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
