//
//  GameViewController.swift
//  BombApp
//
//  Created by Владислав on 07.08.2023.
//

import UIKit

class GameViewController: UIViewController {

    private let gameStartView = GameStartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setConstraints()
    }
    
    private func updateUI() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        view.addSubview(gameStartView)
    }
}

extension GameViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            gameStartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gameStartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            gameStartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gameStartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}
