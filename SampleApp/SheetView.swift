//
//  SheetView.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/06/22.
//

import SwiftUI

struct SheetView: View {
    
    
    @EnvironmentObject var ObakeName: Obakeinfo
    @EnvironmentObject var description: Obakeinfo
    @EnvironmentObject var rea: Obakeinfo
    
    @Binding var isShowingSheet : Bool
    @EnvironmentObject var ObakePoint: SjAndCn
    
    var body: some View {
        
        VStack{
        
            Image(systemName: "chevron.down")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
                .padding(30)
            
            
        
            VStack(alignment: .leading){
                Text("No.\(self.ObakePoint.Obake)")
                    .offset(x: 15, y: 0)
                    .foregroundColor(Color.init(red: 0.12, green: 0.20, blue: 0.70))
                    .font(.system(size: 20, weight: .semibold))
       
                Image("Obake\(self.ObakePoint.Obake)")
                    .resizable()
                    .frame(width: 350, height: 350)
                    .border(Color.gray, width: 2)
            }
            
         
            Text(ObakeName.ObakeName[self.ObakePoint.Obake])
                .foregroundColor(Color.init(red: 0.12, green: 0.20, blue: 0.70))
                .font(.system(size: 20, weight: .semibold))
            
            Text(description.description[self.ObakePoint.Obake])
                .padding(30)
        
            Text(rea.rea[self.ObakePoint.Obake])
                .foregroundColor(Color.init(red: 0.12, green: 0.20, blue: 0.70))
                .font(.system(size: 20, weight: .semibold))
                .offset(x: -80, y: 0)
            
            Spacer()
            
            Button(action:{
                self.isShowingSheet = false
                    })  {
                        Text("図鑑に戻る")
                        }
        }//VStack
        
    }//body
}//view
