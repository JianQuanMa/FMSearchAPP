//
//  AlbumTableViewCell.swift
//  LastMusicSearchApp
//
//  Created by Jian Ma on 8/30/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumArtistLabel: UILabel!
    var link = ""
    static let identifier = "AlbumTableViewCell"
    var album : Album! {
        didSet{
            albumTitleLabel.text = album.name
            albumArtistLabel.text = album.artist
            link = album.url
            print("ni hao")
            let url = URL(string: album.images[0].text)
            let data = try? Data(contentsOf: url!)
            albumImageView.image = UIImage(data: data!)
        }
    }
}
