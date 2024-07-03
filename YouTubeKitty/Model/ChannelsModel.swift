//
//  ChannelsModel.swift
//  YouTubeKitty
//
//  Created by Fatima Ramirez on 03/07/24.
//

import Foundation

struct ChannelsModel: Decodable {
    
    let kind: String
    let etag: String
    let pageInfo: PageInfo
    let items: [Items]
    
    // ESTRUCTURAS 
    struct PageInfo: Decodable {
        let totalResults: Int
        let resultsPerPage: Int
    }
    
    struct Items: Decodable{
        let kind: String
        let etag: String
        let id: String
        let snippet: Snippet
        
            struct Snippet: Decodable {
                let title: String
                let description: String
                let customUrl: String
                let publishedAt: String
                let thumbnails: Thumbnails
                let defaultLanguage: String
                let localiced: Localized
                let country: String
                
                struct Thumbnails: Decodable {
                    let medium: Url
                        struct Url: Decodable {
                            let url: String
                        }
                }
                
                struct Localized: Decodable {
                    let tittle: String
                    let description: String
                }
            }
    }
    
}
