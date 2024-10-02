//
//  Home.swift
//  News App
//
//  Created by Youssef Al-Hassan on 02/10/2024.
//

import SwiftUI

struct JSON_Articles: Codable {
    let results: [Article]
}

struct Home: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    EmptyView()
                }
            }
            .navigationTitle("NY Times Most Popular")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                   
                }) {
                    Image(systemName: "line.horizontal.3")
                },
                trailing: HStack {
                    Button(action: {
                        print("Search button tapped")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    
                    Button(action: {
                        print("Three dots button tapped")
                    }) {
                        Image(systemName: "ellipsis")
                    }
                }
            )
        }
    }
}

#Preview {
    Home()
}
