//
//  ViewController.swift
//  LastMusicSearchApp
//
//  Created by Jian Ma on 8/30/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = ViewModel()
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var MaintableView: UITableView!
    @IBAction func tfTextDidChanged(_ sender: UITextField) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        MaintableView.register(UINib(nibName: AlbumTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: AlbumTableViewCell.identifier)
    }


}
extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return viewModel.albums.count
        case 1:
            return viewModel.tracks.count
        case 2:
            return viewModel.artists.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier = ""
        if indexPath.row < viewModel.albums.count{
            identifier = AlbumTableViewCell.identifier
         //   let cell = UITableViewCell(style: .default, reuseIdentifier: identifier) as! AlbumTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AlbumTableViewCell

            let album = viewModel.albums[indexPath.row]
            cell.album = album
            return cell
        }else if indexPath.row < viewModel.albums.count + viewModel.tracks.count{
            identifier = TrackTableViewCell.identifier
        }else{
            identifier = ArtistTableViewCell.identifier
        }
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        return cell
    }
}

extension ViewController : ViewModelDelegate{
    func update() {
        DispatchQueue.main.async {
            self.MaintableView.reloadData()
        }
    }
}
extension ViewController : UITextFieldDelegate{
    
}
