//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Alexey Baryshnikov on 16.10.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    private func configureSongs() {
        songs.append(Song(song: "In Waves",
                          artist: "Trivium",
                          album: "In Waves",
                          image: "Triviuminwavescoverart.jpg",
                          track: "Trivium_-_In_Waves.mp3"))
        songs.append(Song(song: "I Love It",
                          artist: "Icona Pop",
                          album: "some album",
                          image: "Icona_Pop_I_Love_It_logo_2.jpg",
                          track: "Icona_Pop_feat._Charli_XCX_-_I_Love_It_(feat._Charli_XCX).mp3"))
        songs.append(Song(song: "BLACK",
                          artist: "Ypo To Miden",
                          album: "some album",
                          image: "black.png",
                          track: "Ypo_To_Miden_-_BLACK.mp3"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = song.track
        cell.detailTextLabel?.text = song.album
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Avenir Next", size: 16)
        cell.imageView?.image = UIImage(named: song.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else { return }
        vc.songs = songs
        vc.currentSongIndex = position
        
        
        present(vc, animated: true, completion: nil)
    }
}

