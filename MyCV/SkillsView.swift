//
//  SkillsView.swift
//  MyCV
//
//  Created by Arlinda Islami on 2025-01-15.
//

import SwiftUI

struct SkillsView: View {
    @Binding var skills: [String]

    var body: some View {
        VStack {
            ForEach(0..<skills.count, id: \.self) { index in
                TextField("Skill \(index + 1)", text: $skills[index])
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
            }

            Button(action: addSkill) {
                Text("Add More Skills")
                    .foregroundColor(.blue)
                    .padding()
            }
        }
    }

    func addSkill() {
        if skills.count < 5 {
            skills.append("")
        }
    }
}
