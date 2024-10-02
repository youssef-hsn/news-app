//
//  Home.swift
//  News App
//
//  Created by Youssef Al-Hassan on 02/10/2024.
//

import SwiftUI

struct Home: View {
    @State var test: String = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    EmptyView()
                }.searchable(text: $test)
            }
            .navigationTitle("NY Times Most Popular")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    print("Menu button tapped")
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
