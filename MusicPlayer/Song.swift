//
//  Song.swift
//  MusicPlayer
//
//  Created by Alexey Baryshnikov on 16.10.2020.
//

import UIKit

class Song: NSObject {
    let song: String
    let artist: String
    let album: String
    let image: String
    let track: String
    
    init(song: String, artist: String, album: String, image: String, track: String) {
        self.song = song
        self.artist = artist
        self.album = album
        self.image = image
        self.track = track
    }
}
