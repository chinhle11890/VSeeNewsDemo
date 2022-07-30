//
//  NewsDetailsViewController.swift
//  VSeeNews
//
//  Created by Chinh Le on 30/07/2022.
//

import UIKit
import WebKit

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
}
