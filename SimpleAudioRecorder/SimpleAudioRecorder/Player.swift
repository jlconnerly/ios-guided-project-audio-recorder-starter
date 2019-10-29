//
//  Player.swift
//  SimpleAudioRecorder
//
//  Created by Paul Solt on 10/29/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import AVFoundation

// AVAudioPlayerDelegate requires a NSObject subclass
class Player: NSObject {
	
	var audioPlayer: AVAudioPlayer?
	
	// init
	// isPlaying
	// play
	// pause
	// playPause
	// seekToPosition: Double
	
	override init() {
		let songURL = Bundle.main.url(forResource: "piano", withExtension: "mp3")!
		
		// create an audio player
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: songURL)
		} catch {
			print("AudioPlayer Error: \(songURL)")
		}
		
		super.init()
	}
	
	
}


