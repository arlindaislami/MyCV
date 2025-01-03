//
//  HomeView.swift
//  MyCV
//
//  Created by Arlinda Islami on 2025-01-03.
//

import SwiftUI

struct HomeView: View {
    init() {
         let appearance = UITabBarAppearance()
         appearance.backgroundColor = UIColor(Color(hex: "F4F3F3")) // Ngjyra pastel blu për sfondin
         
         // Ngjyra për tab-et jo aktive
         appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color(hex: "89BAD3")) // Gri e zbehtë për ikonat jo aktive
         appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
             .foregroundColor: UIColor(Color(hex: "89BAD3")) // Gri e zbehtë për tekstin jo aktiv
         ]
         UITabBar.appearance().standardAppearance = appearance
         if #available(iOS 15.0, *) {
             UITabBar.appearance().scrollEdgeAppearance = appearance
         }
     }
  var body: some View {
    TabView {
        // MyFiles
            MyFilesView()
        .tabItem {
          VStack {
            Image(systemName: "doc.text.fill")
            Text("My Files")
          }
        }
        // CreateNew CV
       CreateNewCVView()
        .tabItem {
          VStack {
            Image(systemName: "plus.square.fill")
            Text("Create New")
          }
        }
        // Profile
      ProfileView()
        .tabItem {
          VStack {
            Image(systemName: "person.crop.circle.fill")
            Text("Profile")
          }
        }
      }
    .accentColor(Color(hex: "396F8A")) // Active Tab
    }
  }
#Preview {
    HomeView()
}

