//
//  Home.swift
//  News App
//
//  Created by Youssef Al-Hassan on 02/10/2024.
//

import SwiftUI

struct Home: View {
    @State private var articles: [Article] = []
    @State private var isLoading = true
    private let newsService = NewsService()
    
    var body: some View {
        
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView() // Show progress while loading
                } else {
                    List(articles) { article in
                        NavigationLink(destination: ArticleDetail(article: article)) {
                            ArticleSummary(article: article)
                        }
                    }
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
        }.onAppear(perform: fetchArticles)
    }
    
    private func fetchArticles() {
        newsService.fetchArticles { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedArticles):
                    self.articles = fetchedArticles
                    self.isLoading = false
                case .failure(let error):
                    print("Error fetching articles: \(error)")
                    self.isLoading = false
                }
            }
        }
    }
}

#Preview {
    Home()
}
