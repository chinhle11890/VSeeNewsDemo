//
//  APIManager.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//


import Foundation
import Alamofire

class APIManager: NSObject {
    internal static func fetchNews(page: Int, completion: @escaping (Bool, [Article]) -> Void) {
        var headers = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        headers["X-Api-Key"] = API_KEY
        
        var params = Parameters()
        params["country"] = "us"
        params["page"] = page
        
        guard let url = URL(string: API_URL) else { return }
        let request = AF.request(url, parameters: params, headers: headers)
        request.validate().responseDecodable(of: ArticlesResult.self) { response in
            guard let articlesResult = response.value else { return }
            let articles = articlesResult.articles
            if page == 0 {
                // Cache data of the first page
                LocalDataManager.saveFirstPageResults(news: articles)
            }
            
            // Check if this is the last page
            let currentNumberOfResults = page * ITEM_PER_PAGE + articles.count
            let isLastPage = (currentNumberOfResults >= articlesResult.totalResults)
            
            completion(isLastPage, articles)
        }
    }
}
