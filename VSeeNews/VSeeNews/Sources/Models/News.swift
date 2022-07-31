//
//  News.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//

import UIKit
import RealmSwift

class NewsResult: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}

class Article: Decodable {
//    @objc dynamic var author = ""
    @objc dynamic var title = ""
//    @objc dynamic var newsDescription = ""
//    @objc dynamic var url = ""
//    @objc dynamic var urlToImage = ""
//    @objc dynamic var publishedAt = ""
//    @objc dynamic var content = ""
    
    enum CodingKeys: String, CodingKey {
//        case author
        case title
//        case newsDescription = "description"
//        case url
//        case urlToImage
//        case publishedAt
//        case content
    }
}
