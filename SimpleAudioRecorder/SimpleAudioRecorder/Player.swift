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
	
	// isPlaying
	// play
	// pause
	// playPause
	
	var isPlaying: Bool {
		return audioPlayer?.isPlaying ?? false
	}
	
	func play() {
		// Option 1
//		if let audioPlayer = audioPlayer {
//			audioPlayer.play()
			// do other work here
//		}
		
		// Option 2
//		guard let audioPlayer = audioPlayer else {
//			print("Error: no player")
//			return
//		}
//
//		audioPlayer.play()
//      analytics.record("play")
		
		// Option 3: Optional chaining
		audioPlayer?.play()		 // if nil, this is a no-op (no operation: i.e.: nothing happens)
	}
	
	
	// seekToPosition: Double

	
	
	
}


