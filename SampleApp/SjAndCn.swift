//
//  SjAndCn.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/02/27.
//

import SwiftUI
 
class SjAndCn : ObservableObject {      //グローバル変数を格納しているクラスの作成
    @Published var  SubTitle: [String] = Array(repeating: "", count: 36)    //グローバル変数として使う、科目名を格納する配列。文字型で、初期値は「”　”」、要素は0~35番目まで
    @Published var  ClassNo: [String] = Array(repeating: "", count: 36)     //グローバル変数として使う、教室名を格納する配列。文字型で、初期値は「”　”」、要素は0~35番目まで
    
    @Published var  Memo: [String] = Array(repeating: "", count: 36)
    
    @Published var  Absence: [Int] = Array(repeating: 0, count: 36)
    
    @Published var Point = 0  //タスク完了数
    
    @Published var Obake = 0  //おばけ詳細表示
    
}    //クラス終了


