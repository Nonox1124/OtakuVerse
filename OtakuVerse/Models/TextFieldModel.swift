//
//  TextFieldModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 30/01/2025.
//

import SwiftUI

struct MyTextField: View {
    
    let title: String
    let isNumPad: Bool
    @Binding var text: String
    @FocusState private var isFocused: Bool
    @State private var titleWidth: CGFloat = 0
    
    var titleOffsetX: CGFloat {
        let shiftFactor: CGFloat = titleWidth * 0.1
        return !isFocused || text.isEmpty ? shiftFactor : 0
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .background(GeometryReader { geometry in
                    Color.clear.onAppear {
                        titleWidth = geometry.size.width
                    }
                })
                .opacity(0)
            Text(title)
                .foregroundColor(isFocused || !text.isEmpty ? .paleLavender : .white)
                .offset(x: titleOffsetX, y: isFocused || !text.isEmpty ? -25 : 0)
                .scaleEffect(isFocused || !text.isEmpty ? 0.9 : 1.2)
                .animation(.easeInOut(duration: 0.3), value: isFocused || !text.isEmpty)

            TextField("", text: $text)
                .padding(.top, 15)
                .focused($isFocused)
                .keyboardType(isNumPad ? .numberPad : .default)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 35).stroke(isFocused ? .ligthPurple : .myGray, lineWidth: 1))
        .padding()
    }
}

#Preview {
    @Previewable @State var text = ""
    MyTextField(title: "Enter a title", isNumPad: false, text: $text)
}
