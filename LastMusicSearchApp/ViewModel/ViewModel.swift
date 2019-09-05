//
//  ViewModel.swift
//  LastMusicSearchApp
//
//  Created by Jian Ma on 9/3/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func update()
}

class ViewModel{
    
    
    weak var delegate: ViewModelDelegate?
    
    var albums = [Album](){
        didSet {
            delegate?.update()
        }
    }
    var tracks = [Track](){
        didSet {
            delegate?.update()
        }
    }
    var artists = [Artist](){
        didSet {
            delegate?.update()
        }
    }
    
    func getAlbums(with searchWord: String ){
        FMService.shared.getAlbums(with: searchWord) { [weak self](albs) in
            self?.albums = albs
            print(albs.count)
        }
    }
    func getTracks(with searchWord: String){
        FMService.shared.getTracks(with: searchWord) { [weak self](trks) in
            self?.tracks = trks
        }
    }
    func getArtists(with searchWord: String){
        FMService.shared.getArtists(with: searchWord) { [weak self](arts) in
            self?.artists = arts
        }
    }
    
    typealias results = ([AlbumModel], [TrackModel], [ArtistModel])
    
}
