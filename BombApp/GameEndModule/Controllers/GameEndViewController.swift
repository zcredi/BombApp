//
//  GameEndViewController.swift
//  BombApp
//
//  Created by Владислав on 07.08.2023.
//

import UIKit

class GameEndViewController: UIViewController {
    
    var penalties = Question()
    private let gameEndView = GameEndView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        updateUI()
        setConstraints()
        setupNavigationBar()
        penalties.generatePunishments()
        nextQuestButtonPressed()
    }
    
    private func updateUI() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        view.addSubview(gameEndView)
    }
    
    private func setupNavigationBar() {
        let categoreView = UILabel()
        categoreView.text = "Игра"
        categoreView.textColor = .purpleColor
        categoreView.font = UIFont(name: "DelaGothicOne-Regular", size: 30)
        self.navigationItem.titleView = categoreView
        let gameStopButton = createCustomButton(selector: #selector(stopOrResumeGame))
    }
    
    @objc func stopOrResumeGame() {
        print("Game stop/resume")
    }
    
    @objc func nextQuestButtonPressed() {
        gameEndView.questLabel.text = penalties.getRandomPunishments()
    }
    
    @objc func repeatButtonPressed(_ sender: UIButton) {
        let vc = MainViewController()
        self.navigationController?.setViewControllers([vc], animated: false)
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
