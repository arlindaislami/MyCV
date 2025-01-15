//
//  WorkExperienceView.swift
//  MyCV
//
//  Created by Arlinda Islami on 2025-01-15.
//

import SwiftUI

struct WorkExperienceView: View {
    @Binding var company: String
    @Binding var position: String
    @Binding var startDate: Date
    @Binding var endDate: Date

    var body: some View {
        VStack {
            TextField("Company", text: $company)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)

            TextField("Position", text: $position)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)

            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                .padding(.horizontal)

            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                .padding(.horizontal)
        }
    }
}
