//
//  ArtistModel.swift
//  LastMusicSearchApp
//
//  Created by Jian Ma on 9/3/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

struct ArtistModel : Decodable{
    let results : ArtistResult
}
struct ArtistResult: Decodable{
    let totalResults : String
    let artistmatches : [Artist]
    
    private enum Codingkeys : String, CodingKey{
        case totalResults = "opensearch:totalResults", artistmatches
    }
}

struct Artist: Decodable{
    let name : String
    let url : String
    let images : [Image]
}
