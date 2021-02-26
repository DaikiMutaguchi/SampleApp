//
//  Text.swift
//  SampleApp
//
//  Created by 牟田口大輝 on 2021/02/26.
//

import SwiftUI

struct TextView: View {
    @State var name: String = ""
    @State var state: String = "Closed"

    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                // ここが大事
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
            
            VStack {
                Text("Result: ") + Text(name)
                TextField("Placeholder", text: $name)
                    .padding()
                    .border(Color.green, width: CGFloat(2))
                Text("Keyboard: ") + Text(state)
            }
        }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
            self.state = "Opened"
        }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)) { _ in
            self.state = "Closed"
        }
    }
}

// ここが大事
extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
