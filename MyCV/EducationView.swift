//
//  EducationView.swift
//  MyCV
//
//  Created by Arlinda Islami on 2025-01-15.
//

import SwiftUI

struct EducationView: View {
    @Binding var degree: String
    @Binding var degreeDescription: String
    @Binding var institution: String
    @Binding var level: String
    
    @Binding var educations: [String]

    var body: some View {
        VStack {
            TextField("Degree", text: $degree)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)

            TextField("Degree Description", text: $degreeDescription)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)

            TextField("Institution", text: $institution)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)

            TextField("Level (e.g., Bachelor's, Master's)", text: $level)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)

            Button(action: addEducation) {
                Text("Add More Education")
                    .foregroundColor(.blue)
                    .padding()
            }
        }
    }

    func addEducation() {
        if educations.count < 5 {
            educations.append("")
        }
    }
}
