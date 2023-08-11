//
//  QuestLogic.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 09.08.2023.
//

import UIKit
import AVFoundation

final class QuestLogic {
    
    var wickPlayer: AVAudioPlayer?
    var beatPlayer: AVAudioPlayer?
    var blastPlayer: AVAudioPlayer?
    
    func playBlastSound() {
        let url = Bundle.main.url(forResource: "blast", withExtension: "wav")
        blastPlayer = try! AVAudioPlayer(contentsOf: url!)
        blastPlayer?.volume = 1
        blastPlayer?.play()
    }
    
    func playBackgroundSound() {
        let wickUrl = Bundle.main.url(forResource: "wick", withExtension: "wav")
        wickPlayer = try! AVAudioPlayer(contentsOf: wickUrl!)
        wickPlayer?.volume = 0.5
        wickPlayer?.play()
        
        let beatUrl = Bundle.main.url(forResource: "heartBeat", withExtension: "wav")
        beatPlayer = try! AVAudioPlayer(contentsOf: beatUrl!)
        beatPlayer?.volume = 1
        beatPlayer?.play()
    }
    
    func stopSounds() {
        wickPlayer?.stop()
        beatPlayer?.stop()
        
    }
    
    func pauseSounds() {
        wickPlayer?.pause()
        beatPlayer?.pause()
    }
    
}
