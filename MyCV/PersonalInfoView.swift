//
//  PersonalInfoView.swift
//  MyCV
//
//  Created by Arlinda Islami on 2025-01-15.
//

import SwiftUI

struct PersonalInfoView: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var phone: String

    var body: some View {
        VStack {
            TextField("Name Lastname", text: $name)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)

            TextField("Email", text: $email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)

            TextField("Phone", text: $phone)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)
        }
    }
}
