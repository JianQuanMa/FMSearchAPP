//
//  APIgetter.swift
//  LastMusicSearchApp
//
//  Created by Jian Ma on 9/2/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

struct URLGetter{
    
    // http://ws.audioscrobbler.com/2.0/?method=track.search&track=Believe&api_key=0cb6daa5286a5337b7f0b27d997a176e&format=json
    // http://ws.audioscrobbler.com/2.0/?method=album.search&album=believe&api_key=0cb6daa5286a5337b7f0b27d997a176e&format=json
    // http://ws.audioscrobbler.com/2.0/?method=artist.search&artist=cher&api_key=YOUR_API_KEY&format=json
    
    let baseURLString = "http://ws.audioscrobbler.com/2.0/?"
    let apiKeyString = "&api_key=0cb6daa5286a5337b7f0b27d997a176e&format=json"
    
    func getUrls(with searchWord : String)-> [URL]{
        var urls : [URL] = []
        let trackURL = URL(string: "\(baseURLString)method=track.search&track=\(searchWord)\(apiKeyString))")!
        urls.append(trackURL)
        let albumURL = URL(string: "\(baseURLString)method=album.search&track=\(searchWord)\(apiKeyString))")!
        urls.append(albumURL)
        let artistURL = URL(string: "\(baseURLString)method=artist.search&track=\(searchWord)\(apiKeyString))")!
        urls.append(artistURL)
        return urls
    }
    
}
