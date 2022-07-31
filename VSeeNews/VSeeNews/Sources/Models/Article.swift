//
//  News.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//

import UIKit

class ArticlesResult: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status) ?? ""
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults) ?? 0
        articles = try values.decodeIfPresent([Article].self, forKey: .articles) ?? []
    }
}

class Article: Encodable, Decodable {
    var author = ""
    var title = ""
    var newsDescription = ""
    var url = ""
    var urlToImage = ""
    var publishedAt = ""
    var content = ""
    
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case newsDescription = "description"
        case url
        case urlToImage
        case publishedAt
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author) ?? ""
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        newsDescription = try values.decodeIfPresent(String.self, forKey: .newsDescription) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage) ?? ""
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
    }
}
