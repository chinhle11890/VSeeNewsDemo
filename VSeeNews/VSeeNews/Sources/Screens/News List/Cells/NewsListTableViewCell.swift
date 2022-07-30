//
//  NewsListTableViewCell.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//

import UIKit
import SDWebImage

class NewsListTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func setNews(news: Article) {
//        newsImageView.sd_setImage(with: URL(string: news.urlToImage))
        titleLabel.text = news.title
//        descriptionLabel.text = news.newsDescription
//        timeLabel.text = news.publishedAt
    }
}
