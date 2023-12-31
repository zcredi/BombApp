//
//  GameStartView.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 07.08.2023.
//

import UIKit

class GameStartView: UIView {
    
    private let titleLabel = UILabel(text: "Игра",
                             font: UIFont.delaGothicOneRegular30()!,
                             color: .purpleColor)
    private let gameLabel = UILabel(text: "Нажмите “Запустить” чтобы начать игру",
                             font: UIFont.delaGothicOneRegular32()!,
                             color: .purpleColor)
    
    private let backButton = BackButton()
    private let stopButton = StopButton()
    private let startButton = PurpleButton(text: "Запустить")
    
    private let bombImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "gameBomb")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
    }
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
