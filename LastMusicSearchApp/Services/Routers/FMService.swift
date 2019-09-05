//
//  FMService.swift
//  LastMusicSearchApp
//
//  Created by Jian Ma on 9/4/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

typealias AlbumHandler = ([Album]) -> Void
typealias TrackHandler = ([Track]) -> Void
typealias ArtistHandler = ([Artist]) -> Void

final class FMService{
    
    static let shared = FMService()
    private init(){}
    
    func getAlbums(with searchWord : String, completion: @escaping AlbumHandler){
        let urls = URLGetter().getUrls(with: searchWord)
        URLSession.shared.dataTask(with: urls[0]) { (dat, _, err) in
            if let data = dat{
                do {
                    let jsonResonse = try JSONDecoder().decode(AlbumModel.self, from: data)
                    let albums = jsonResonse.results.albummatches
                    completion (albums)
                } catch {
                    print(error.localizedDescription)
                    completion ([])
                    return
                }
            }
            }.resume()
    }
    func getTracks(with searchWord : String, completion: @escaping TrackHandler){
        let urls = URLGetter().getUrls(with: searchWord)
        URLSession.shared.dataTask(with: urls[1]) { (dat, _, err) in
            if let data = dat{
                do {
                    let jsonResonse = try JSONDecoder().decode(TrackModel.self, from: data)
                    let tracks = jsonResonse.results.trackmatches
                    completion (tracks)
                } catch {
                    print(error.localizedDescription)
                    completion ([])
                    return
                }
            }
            }.resume()
    }
    func getArtists(with searchWord : String, completion: @escaping ArtistHandler){
        let urls = URLGetter().getUrls(with: searchWord)
        URLSession.shared.dataTask(with: urls[2]) { (dat, _, err) in
            if let data = dat{
                do {
                    let jsonResonse = try JSONDecoder().decode(ArtistModel.self, from: data)
                    let artists = jsonResonse.results.artistmatches
                    completion (artists)
                } catch {
                    print(error.localizedDescription)
                    completion ([])
                    return
                }
            }
            }.resume()
    }
    //TODO
    func getSearch(with searchWord : String,  ofType : SearchType, completion: @escaping AlbumHandler){
        let urls = URLGetter().getUrls(with: searchWord)
        URLSession.shared.dataTask(with: urls[0]) { (dat, _, err) in
            if let data = dat{
                do {
                    let jsonResonse = try JSONDecoder().decode(AlbumModel.self, from: data)
                    let albums = jsonResonse.results.albummatches
                    completion (albums)
                } catch {
                    print(error.localizedDescription)
                    completion ([])
                    return
                }
            }
            }.resume()
    }
    
    
}

enum SearchType{
    case albums
    case tracks
    case artists
}
