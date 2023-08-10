//
//  GameEndViewController.swift
//  BombApp
//
//  Created by Владислав on 07.08.2023.
//

import UIKit

class GameEndViewController: UIViewController {

    private let gameEndView = GameEndView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setConstraints()
        setupNavigationBar()
    }
    
    private func updateUI() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        view.addSubview(gameEndView)
    }
    
    private func setupNavigationBar() {
        createCustomNavigationBar()
        
        let sceneTitleView = createCustomTitleView(sceneTitle: "Игра")
        let gameStopButton = createCustomButton(selector: #selector(stopOrResumeGame))
        navigationItem.titleView = sceneTitleView
        navigationItem.rightBarButtonItems = [gameStopButton]
    }
    
    @objc func stopOrResumeGame() {
        print("Game stop/resume")
    }
    
    @objc func nextQuestButtonPressed() {
        print("nextQuestButtonPressed")
    }
    
    @objc func repeatButtonPressed() {
        print("repeatButtonPressed")
    }
    
}

extension GameEndViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            gameEndView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gameEndView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            gameEndView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gameEndView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}
