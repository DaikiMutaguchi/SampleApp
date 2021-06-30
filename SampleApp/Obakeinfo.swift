//
//  Obakeinfo.swift
//  SampleApp
//
//  Created by Daiki Mutaguchi on 2021/06/30.
//


import SwiftUI
 
class Obakeinfo : ObservableObject {      //グローバル変数を格納しているクラスの作成
    
    @Published var ObakeName = ["ToDoを実行しておばけを集めよう！", "おさるオバケ", "さかさおばけ", "木曜日",
                     "金曜日" , "たぬきおばけ"]
    
    @Published var rea = ["レア度：？？？？？",
        "レア度：☆☆☆☆★","レア度：☆☆☆☆★","レア度：☆☆☆☆★","レア度：☆☆☆☆★","レア度：☆☆☆☆★",
               "レア度：☆☆☆★★","レア度：☆☆☆★★","レア度：☆☆☆★★","レア度：☆☆☆★★","レア度：☆☆☆★★",
               "レア度：☆☆★★★","レア度：☆☆★★★","レア度：☆☆★★★","レア度：☆☆★★★","レア度：☆☆★★★","レア度：☆★★★★","レア度：☆★★★★","レア度：☆★★★★","レア度：★★★★★","レア度：★★★★★",]
    
    @Published var description = ["ダミー",
                                  "どこにでも現れる普遍的なおばけ。\n勉強して頑張ってる人を見つけてふよふお応援するよ",
    "さかさまになったおばけ"]
    
    
}    
