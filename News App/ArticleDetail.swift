//
//  ArticleDetail.swift
//  News App
//
//  Created by Youssef Al-Hassan on 02/10/2024.
//

import SwiftUI

struct ArticleDetail: View {
    let article: Article
    var body: some View {
        NavigationView {
            VStack {
                Text("W.I.P.")
                    .font(.title)
                Text(article.title)
                    .font(.headline)
                Text(article.description)
                    .font(.body)
                Link("Read More", destination: URL(string: article.url)!)
            }
        }.navigationTitle("Article Details")
    }
}

#Preview {
    ArticleDetail(article: dummyArticle)
}
