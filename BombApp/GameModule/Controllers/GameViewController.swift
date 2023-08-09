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
        setupNavigationBar()
    }
    
    private func updateUI() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        view.addSubview(gameStartView)
//        gameStartView.closure = { [weak self] in
//            self?.startButtonPressed()
//        }
    }
    
    private func setupNavigationBar() {
        createCustomNavigationBar()
        
        let sceneTitleView = createCustomTitleView(sceneTitle: "Игра")
        let gameStopButton = createCustomButton(selector: #selector(stopOrResumeGame))
        navigationItem.titleView = sceneTitleView
        navigationItem.rightBarButtonItems = [gameStopButton]
    }
    
    @objc func startButtonPressed() {
        print("button is hidden and title changed")
        gameStartView.startButton.isHidden = true
    }
    
    @objc func stopOrResumeGame() {
        print("Game stop/resume")
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
