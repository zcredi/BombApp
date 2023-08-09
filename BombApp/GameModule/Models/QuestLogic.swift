//
//  QuestLogic.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 09.08.2023.
//

import UIKit
import Lottie

struct QuestLogic {
    
    var animationView: LottieAnimationView = .init()
    
    mutating func startAnimationView() {
        animationView = .init(name: "bombAnimation")
        animationView.contentMode = .scaleToFill
        
        //add dependence on timer settings
        animationView.animationSpeed = 0.5
        animationView.loopMode = .playOnce
        animationView.play()
    }
    
//    mutating func closeAnimationView() {
//        
//        let markerName = animationView.animation?.markerNames
//        animationView.play(fromMarker: "Start", toMarker: "End"
//        
//    }
}
