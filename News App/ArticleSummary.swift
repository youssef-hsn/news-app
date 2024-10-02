//
//  ArticleSummary.swift
//  News App
//
//  Created by Youssef Al-Hassan on 02/10/2024.
//

import SwiftUI

let dummyArticle = Article(
    id: 1,
    title: "Breaking News: SwiftUI Takes Over",
    description: "This is a brief description of the article about SwiftUI's growing influence in the development world.",
    author: "John Doe",
    publishedAt: "2024-10-02",
    url: "https://www.example.com/swiftui-takes-over",
    media: [Media(
           mediaMetadata: [
               MediaMetadata(
                   url: "https://api.dicebear.com/9.x/icons/png", // Sample Dicebear URL
                   format: "Standard Thumbnail"
               )
           ]
        )]
)

struct Article: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let author: String
    let publishedAt: String
    let url: String
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case id, title, url, media
        case description = "abstract"
        case author = "byline"
        case publishedAt = "published_date"
    }
}

struct Media: Codable {
    let mediaMetadata: [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url: String
    let format: String
//    let height: Int
//    let width: Int
}

struct ArticleSummary: View {
    let article: Article
    var body: some View {
        HStack{
            if let urlString = article.media.first?.mediaMetadata.first?.url, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .cornerRadius(25)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .foregroundColor(.red)
            }
            VStack (alignment: .leading){
                Text(article.title)
                    .font(.headline)
                HStack{
                    Text(article.author)
                        .font(.subheadline)
                    Spacer()
                    Text(article.publishedAt)
                        .font(.subheadline)
                }
            }.padding(.leading, 2)
        }.padding()
    }
}

#Preview {
    ArticleSummary(article: dummyArticle)

}
