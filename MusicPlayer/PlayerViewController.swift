//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by Alexey Baryshnikov on 16.10.2020.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var fastBackward: UIButton!
    @IBOutlet weak var fastForward: UIButton!
    @IBOutlet weak var play: UIButton!
    
    public var currentSongIndex = 0
    public var songs: [Song] = []
    var buttonsStack = UIStackView()
    //MARK: - setup methods
    private func setupArt() {
        albumArt.image = UIImage(named: songs[currentSongIndex].image)
        
        albumArt.translatesAutoresizingMaskIntoConstraints = false
        albumArt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        albumArt.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        albumArt.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 220).isActive = true
        albumArt.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        view.addSubview(albumArt)
    }
    
    private func setupButtons() {
        
        buttonsStack.axis = .horizontal
        buttonsStack.alignment = .fill
        buttonsStack.distribution = .equalSpacing
        buttonsStack.insertSubview(fastForward, at: 0)
        buttonsStack.insertSubview(play, at: 1)
        buttonsStack.insertSubview(fastBackward, at: 2)
        
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.topAnchor.constraint(equalTo: albumArt.bottomAnchor, constant: 20).isActive = true
        buttonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        buttonsStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        view.addSubview(buttonsStack)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArt()
        setupButtons()
    }

}
