//
//  NewsListViewModel.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//

import UIKit

class NewsListViewModel: NSObject {
    var newsList: [Article] = []
    private var currentPage: Int = 0
    
    func fetchNews(loadingMore: Bool = false) {
        if loadingMore {
            // Increase the current page and request
            currentPage += 1
        } else {
            // Reset current page and list if reloading
            currentPage = 0
            newsList = []
        }
        APIManager.fetchNews(page: currentPage) { news in
            self.newsList.append(contentsOf: news)
        }
    }
}
