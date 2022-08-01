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

            // Encode News
            let data = try encoder.encode(news)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: STORAGE_KEY)

        } catch {
            print("Unable to Encode Array of News (\(error))")
        }
    }
    
    internal static func loadFirstPageResults() -> [Article] {
        if let data = UserDefaults.standard.data(forKey: STORAGE_KEY) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let news = try decoder.decode([Article].self, from: data)
                return news
            } catch {
                print("Unable to Decode Array of News (\(error))")
            }
        }
        
        return []
    }
}
