//
//  AlbumModel.swift
//  LastMusicSearchApp
//
//  Created by Jian Ma on 8/30/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation


struct AlbumModel: Decodable{
    let results : AlbumResult
    
    }

struct AlbumResult: Decodable{
    let totalResults : Int
    let albummatches : [Album]
    private enum Codingkeys : String, CodingKey{
        case totalResults = "opensearch:totalResults", albummatches
    }
}

struct Album : Decodable{
    
    let name : String
    let artist : String
    let url : String
    let images : [Image]
}

struct Image : Decodable{
    let text : String
    let size : ImageSize
    private enum Codingkeys : String, CodingKey{
        case text  = "#text", size
    }
}

enum ImageSize: String, Decodable{
    case small
    case meidum
    case large
    case extralarge
}
