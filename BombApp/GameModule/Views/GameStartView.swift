//
//  GameStartView.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 07.08.2023.
//

import UIKit

class GameStartView: UIView {
    
    private let titleLabel = UILabel(text: "Игра",
                                     font: .delaGothicOneRegular30(),
                                     color: .purpleColor)
    private let gameLabel = UILabel(text: "Нажмите “Запустить” чтобы начать игру",
                                    font: .delaGothicOneRegular32(),
                                    color: .purpleColor)
    
    private let backButton = BackButton()
    private let stopButton = StopButton()
    let startButton = PurpleButton(text: "Запустить")
    
    private let bombImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "gameBomb")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    var closure: (() -> Void)?
    private var questLogic = QuestLogic()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        updateUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(stopButton)
        addSubview(gameLabel)
        addSubview(bombImageView)
        addSubview(startButton)
        startButton.addTarget(nil, action: #selector(GameViewController.startButtonPressed), for: .touchUpInside)
    }
    
//    @objc private func startButtonPressed() {
//        closure?()
//        startButton.isHidden = true
//        gameLabel.text = "Назовите зимний вид спорта"
//        if startButton.isHidden {
//            bombImageView.isHidden = true
//
//            let bombView: UIView = {
//                let view = UIView()
//                view.translatesAutoresizingMaskIntoConstraints = false
//                return view
//            }()
//            addSubview(bombView)
//            questLogic.startAnimationView()
//            bombView.addSubview(questLogic.animationView)
//
//            NSLayoutConstraint.activate([
//                questLogic.animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
//                questLogic.animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
//                questLogic.animationView.heightAnchor.constraint(equalToConstant: 330),
//                questLogic.animationView.widthAnchor.constraint(equalToConstant: 330)
//            ])
//            willRemoveSubview(questLogic.animationView)
            //  let gameEndVC = GameEndViewController()
            //  pushViewController(gameEndVC, animated: true)
//        }
//    }
}

extension GameStartView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            backButton.heightAnchor.constraint(equalToConstant: 19),
            backButton.widthAnchor.constraint(equalToConstant: 11),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.widthAnchor.constraint(equalToConstant: 92),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            
            stopButton.heightAnchor.constraint(equalToConstant: 38),
            stopButton.widthAnchor.constraint(equalToConstant: 37),
            stopButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stopButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            gameLabel.heightAnchor.constraint(equalToConstant: 115),
            gameLabel.widthAnchor.constraint(equalToConstant: 329),
            gameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            
            bombImageView.heightAnchor.constraint(equalToConstant: 350),
            bombImageView.widthAnchor.constraint(equalToConstant: 310),
            bombImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bombImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        
            startButton.heightAnchor.constraint(equalToConstant: 80),
            startButton.widthAnchor.constraint(equalToConstant: 275),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
