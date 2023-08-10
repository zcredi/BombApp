//
//  QuestModel.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 09.08.2023.
//

import Foundation
import Lottie

struct QuestModel {
    
    var animationView: LottieAnimationView = .init()
    
    mutating func createAnimationView() {
        animationView = .init(name: "bombAnimation")
        animationView.contentMode = .scaleToFill
        animationView.animationSpeed = 0.7
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func stopAnimationView() {
        animationView.stop()
    }
    
    func playAnimationView() {
        animationView.play()
    }
}
