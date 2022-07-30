//
//  APIManager.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//


import Foundation
import Alamofire

class APIManager: NSObject {
    internal static func fetchNews(page: Int, response: ([Article]) -> Void) {
//        if progress {
//            LoadingPopup.sharedInstance.startAnimation()
//        }
        
        var headers = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        headers["X-Api-Key"] = API_KEY
        
        var params = Parameters()
        params["country"] = "us"
        params["page"] = page
        
        guard let url = URL(string: API_URL) else { return }
        let request = AF.request(url, parameters: params, headers: headers)
        request.validate().responseDecodable(of: NewsResult.self) { response in
            guard let newsResult = response.value else { return }
//            let articles = newsResult.articles
            if page == 0 {
                // Cache data of the first page
            }
//            response(articles)
        }
    }
}
