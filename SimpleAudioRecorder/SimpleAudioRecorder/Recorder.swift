//
//  Recorder.swift
//  SimpleAudioRecorder
//
//  Created by Paul Solt on 10/29/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import AVFoundation

protocol RecorderDelegate {
	
}

class Recorder: NSObject {
	
	var audioRecorder: AVAudioRecorder?
	
	var isRecording: Bool {
		audioRecorder?.isRecording ?? false
	}
	
	override init() {
		super.init()
	}
	
	func record() {
		let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		
		let name = ISO8601DateFormatter.string(from: Date(), timeZone: .current, formatOptions: [.withInternetDateTime])
		
		// <date>.caf
		let file = documentsDirectory.appendingPathComponent(name).appendingPathExtension("caf")
		
		// 44.1 kHz
		let format = AVAudioFormat(standardFormatWithSampleRate: 44_100, channels: 1)!
		
		do {
			print("record: \(file.path)")
			audioRecorder = try AVAudioRecorder(url: file, format: format)
		} catch {
			print("AVAudioRecorder Error: \(error)")
		}
		
		audioRecorder?.record()
	}
	
	func stop() {
		audioRecorder?.stop()
	}
	
	func toggleRecording() {
		if isRecording {
			stop()
		} else {
			record()
		}
	}
}
