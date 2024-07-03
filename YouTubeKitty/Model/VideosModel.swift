//
//  VideosModel.swift
//  YouTubeKitty
//
//  Created by Fatima Ramirez on 03/07/24.
//

import Foundation

struct VideosModel: Decodable{
    let kind: String
    let etag: String
    let items: [Items]
    let pageInfo: PageInfo
    
    struct Items: Decodable {
        let kind: String
        let etag: String
        let id: String
        let snippet: Snippet
        
        struct Snippet: Decodable{
            let publishedAt: String
            let channelId: String
            let tittle: String
            let description: String
            let thumbnails: Thumbnails
            
            struct Thumbnails: Decodable {
                let medium: Url
                struct Url: Decodable {
                    let url: String
                }
            }
            let channelTittle: String
            let categoryId: String
            let liveBroadcastContent: String
            let localized: Localized
            
            struct Localized: Decodable {
                let tittle: String
                let description: String
            }
            let defaultAudioLanguage: String
            
        }
    }
    
    struct PageInfo: Decodable {
        let totalResults: Int
        let resultsPerPage: Int
    }
    
    
}
