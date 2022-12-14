//
//  NewsListViewController.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//

import UIKit

class NewsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    let viewModel = NewsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Articles"
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        viewModel.delegate = self
        viewModel.loadLocalData()
        viewModel.fetchNews()
    }
    
    // MARK - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNewsDetails" {
            let newsDetailsVC = segue.destination as! NewsDetailsViewController
            let urlString = sender as! String
            newsDetailsVC.urlString = urlString
        }
    }
    
    // MARK - Functions
    @objc fileprivate
    func refresh(_ sender: AnyObject) {
        viewModel.fetchNews()
    }
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsListCell", for: indexPath) as! NewsListTableViewCell

        let news = viewModel.newsList[indexPath.row]
        cell.setNews(news: news)
        
        // Check for loading more when reaching the last cell
        if indexPath.row == viewModel.newsList.count - 1, viewModel.currentPage >= 0 {
            viewModel.fetchNews(loadingMore: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let news = viewModel.newsList[indexPath.row]
        if !news.url.isEmpty {
            performSegue(withIdentifier: "showNewsDetails", sender: news.url)
        }
    }
}

extension NewsListViewController: NewsListViewModelDelegate {
    func updateUI() {
        tableView.reloadData()
    }
}

