//
//  ButtonView.swift
//  MyCV
//
//  Created by Arlinda Islami on 2025-01-15.
//

import SwiftUI

// Komponenti ButtonView i stilizuar
struct ButtonView: View {
    var buttontext: String
    var body: some View {
        Text(buttontext)
            .foregroundStyle(Color.white)
            .padding(.vertical, 12)
            .frame(minWidth: 190.0)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "4EB1B5"), // Ngjyra e fillimit
                        Color(hex: "78B6A8"), // Ngjyra e mesme
                        Color(hex: "396F86")  // Ngjyra e fundit
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(12)
            .shadow(radius: 5)
            .padding(.bottom, 12)
    }
}

#Preview {
    ButtonView(buttontext: "Button")
}
