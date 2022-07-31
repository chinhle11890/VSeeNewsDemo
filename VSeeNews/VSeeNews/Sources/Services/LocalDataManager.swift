//
//  LocalDataManager.swift
//  VSeeNews
//
//  Created by Chinh Le on 31/07/2022.
//

import UIKit

class LocalDataManager: NSObject {
    internal static func saveFirstPageResults(news: [Article]) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(news)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "news")

        } catch {
            print("Unable to Encode Array of News (\(error))")
        }
    }
    
    internal static func fetchFirstPageResults() -> [Article] {
        if let data = UserDefaults.standard.data(forKey: "news") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let news = try decoder.decode([Article].self, from: data)
                return news
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        return []
    }
}
