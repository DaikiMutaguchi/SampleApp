//
//  SjAndCn.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/02/27.
//

import SwiftUI
 
class SjAndCn : ObservableObject {
    @Published var  SubTitle: [String] = Array(repeating: "", count: 26)
    @Published var  ClassNo: [String] = Array(repeating: "", count: 26)
}
