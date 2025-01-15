//
//  CreateNewCVView.swift
//  MyCV
//
//  Created by Arlinda Islami on 2025-01-03.
//


import SwiftUI
import Firebase
import FirebaseAuth

struct CreateNewCVView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var company = ""
    @State private var position = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var degree = ""
    @State private var degreeDescription = ""
    @State private var institution = ""
    @State private var level = ""
    @State private var skills: [String] = ["", ""]
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var educations: [String] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Personal Information Section
                SectionHeader(title: "Personal Information")
                PersonalInfoView(name: $name, email: $email, phone: $phone)
                    .padding(.bottom, 30) // Për të shtuar hapësirë pas informacionit personal

                // Work Experience Section
                SectionHeader(title: "Work Experience")
                WorkExperienceView(company: $company, position: $position, startDate: $startDate, endDate: $endDate)
                    .padding(.bottom, 30) // Për të shtuar hapësirë pas përvojës së punës

                // Education Section
                SectionHeader(title: "Education")
                EducationView(degree: $degree, degreeDescription: $degreeDescription, institution: $institution, level: $level, educations: $educations)
                    .padding(.bottom, 30) // Për të shtuar hapësirë pas arsimit

                // Skills Section
                SectionHeader(title: "Skills")
                SkillsView(skills: $skills)
                    .padding(.bottom, 30) // Për të shtuar hapësirë pas aftësive

                // Save Button
                ButtonView(buttontext: "Save CV")
                    .onTapGesture {
                        saveCVData()
                    }
                    .padding(.bottom, 30) // Për të shtuar hapësirë pas butonit të ruajtjes

                // Alert Message
                if showAlert {
                    Text(alertMessage)
                        .foregroundColor(.red)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.red, lineWidth: 1))
                        .padding(.horizontal)
                }
            }
            .padding(.top, 20)
        }
        .background(Color(UIColor.systemGroupedBackground))
    }

    func saveCVData() {
        // Sigurohu që përdoruesi është i identifikuar dhe merr ID-në e tij
        guard let userID = Auth.auth().currentUser?.uid else {
            alertMessage = "User is not logged in"
            showAlert = true
            return
        }
        
        // Referenca për Realtime Database
        let db = Database.database().reference()
        
        // Krijo të dhënat e CV-së përkatëse për përdoruesin
        let personalInfo: [String: Any] = [
            "name": name,
            "email": email,
            "phone": phone
        ]
        
        let workExperience: [String: Any] = [
            "company": company,
            "position": position,
            "startDate": startDate.description,
            "endDate": endDate.description
        ]
        
        let education: [String: Any] = [
            "degree": degree,
            "degreeDescription": degreeDescription,
            "institution": institution,
            "level": level
        ]
        
        let skillsData: [String: Any] = [
            "skills": skills
        ]
        
        let cvData: [String: Any] = [
            "personalInfo": personalInfo,
            "workExperience": workExperience,
            "education": education,
            "skills": skillsData
        ]
        
        // Përdorimi i Realtime Database për të ruajtur të dhënat
        db.child("MyCV")
            .child(userID)
            .child("generatedCVs")
            .childByAutoId()
            .setValue(cvData) { error, _ in
                if let error = error {
                    self.alertMessage = "Error: \(error.localizedDescription)"
                    self.showAlert = true
                } else {
                    self.alertMessage = "CV Saved Successfully!"
                    self.showAlert = true
                }
            }
    }
}

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.primary)
            .padding(.top, 10)
            .padding(.leading, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5) // Për hapësirë pas titullit
    }
}

#Preview {
    CreateNewCVView()
}
