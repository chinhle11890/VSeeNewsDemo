//
//  NewsListViewModel.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//

import UIKit

protocol NewsListViewModelDelegate: class {
    func reloadData()
}

class NewsListViewModel: NSObject {
    var newsList: [Article] = []
    var currentPage: Int = -1
    
    weak var delegate: NewsListViewModelDelegate?
    
    func loadLocalData() {
        let news = LocalDataManager.fetchFirstPageResults()
        if news.count > 0 {
            newsList.append(contentsOf: news)
            self.delegate?.reloadData()
        }
    }
    
    func fetchNews(loadingMore: Bool = false) {
        if !loadingMore {
            // Reset current page if reloading
            currentPage = -1
        }
        // Increase the current page and request
        currentPage += 1
        
        APIManager.fetchNews(page: currentPage) { (isLastPage, news) in
            if isLastPage {
                // Reset the current page and used to check for loading more
                self.currentPage = -1
            }
            
            // Reset list if reloading
            if !loadingMore {
                self.newsList = []
            }
            
            // Add the results and reload table
            self.newsList.append(contentsOf: news)
            self.delegate?.reloadData()
        }
    }
}
