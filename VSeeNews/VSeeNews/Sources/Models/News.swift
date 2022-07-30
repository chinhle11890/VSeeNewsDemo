//
//  News.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//

import UIKit
import RealmSwift

struct NewsResult: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
    
//    required public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        status = try container.decode(String.self, forKey: .status)
//        totalResults = try container.decode(Int.self, forKey: .totalResults)
//        articles = try container.decode([Article].self, forKey: .articles)
//    }
    
//    required convenience public init(from decoder: Decoder) throws {
//        self.init()
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.status = try container.decode(String.self, forKey: .status)
//        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
////        self.articles = try container.decodeIfPresent([News].self, forKey: .articles) ?? [News]()
//        if let array = try container.decodeIfPresent([News].self, forKey: .articles) {
//            self.articles = array
//        } else {
//            self.articles = [News]()
//        }
//    }
}

struct Article: Decodable {
//    @objc dynamic var author = ""
//    @objc dynamic var title = ""
//    @objc dynamic var newsDescription = ""
//    @objc dynamic var url = ""
//    @objc dynamic var urlToImage = ""
//    @objc dynamic var publishedAt = ""
//    @objc dynamic var content = ""
//    dynamic var source = Source()
    
//    var author: String
    var title: String
    var newsDescription: String
    var url: String
//    var urlToImage: String
//    var publishedAt: String
//    var content: String
//    var source: Source
    
    enum CodingKeys: String, CodingKey {
//        case author
        case title
        case newsDescription = "description"
        case url
//        case urlToImage
//        case publishedAt
//        case content
//        case source
    }
}

struct Source: Decodable {
    var id: String
    var name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
