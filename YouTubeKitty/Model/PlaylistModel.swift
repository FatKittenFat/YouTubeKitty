//
//  PlaylistModel.swift
//  YouTubeKitty
//
//  Created by Fatima Ramirez on 26/06/24.
//

import Foundation


struct PlaylistModel: Decodable {
    
    let kind: String
    let pageInfo: PageInfo
    let items: [Items]
    
    struct PageInfo: Decodable{
        let totalResults: Int
        let resultsPerPage: Int
        
    }
    
    struct Items: Decodable {
        let kind: String
        let etag: String
        let id: Id
        let snippet: Snippet
        
        struct Id: Decodable {
            let kind: String
            let channelId: String
        }
        
        struct Snippet: Decodable {
            let publishedAt: String
            let channelID: String
            let tittle: String
            let description: String
            let channelTitle: String
            let thumbnainls: Thumbnails
            
            struct Thumbnails: Decodable {
                let medium: Url
                
                struct Url: Decodable {
                    let url: String
                }
            }
        }
        
    }
    
    
    
}
