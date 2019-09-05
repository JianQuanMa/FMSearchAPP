//
//  TrackModel.swift
//  LastMusicSearchApp
//
//  Created by Jian Ma on 9/3/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation


struct TrackModel: Decodable{
    let results : TrackResult
    
}

struct TrackResult : Decodable{
    let totalResults : String
    let trackmatches : [Track]
    
    private enum Codingkeys : String, CodingKey{
        case totalResults = "opensearch:totalResults", trackmatches
    }
}

struct Track: Decodable{
    let name : String
    let artist : String
    let url : String
    let images : [Image]
}
