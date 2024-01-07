//
//  MainView.swift
//  Pet Adoption
//
//  Created by Ahmed Amin on 03/01/2024.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            
            AnimalIsNearYouView()
                .tabItem {
                    Label("Near you",
                          systemImage: "location")
                }
            
            SearchView()
                .tabItem {
                    Label("Search",
                          systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MainView()
}
