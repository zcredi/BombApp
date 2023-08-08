//
//  GameEndView.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 08.08.2023.
//

import UIKit

class GameEndView: UIView {
    
    private let titleLabel = UILabel(text: "Игра",
                                     font: .delaGothicOneRegular30(),
                                     color: .purpleColor)
    private let backButton = BackButton()
    private let stopButton = StopButton()
    private let warningLabel = UILabel(text: "Проигравший выполняет задание",
                                       font: .delaGothicOneRegular24(),
                                       color: .blackColor)
    private let questLabel = UILabel(text: "В следующем раунде после каждого ответа хлопать в ладоши",
                                     font: .delaGothicOneRegular20(),
                                     color: .purpleColor)
    
    private let explosionImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "explosion")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nextQuestButton = PurpleButton(text: "Другое задание")
    private let repeatButton = PurpleButton(text: "Начать заного")
    
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
        addSubview(warningLabel)
        addSubview(explosionImageView)
        questLabel.shadowColor = .blackColor
        questLabel.shadowOffset = CGSize(width: -0.5, height: -0.5)
        addSubview(questLabel)
        addSubview(nextQuestButton)
        addSubview(repeatButton)
    }
}

extension GameEndView {
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
            
            warningLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            warningLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            warningLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            
            explosionImageView.heightAnchor.constraint(equalToConstant: 300),
            explosionImageView.widthAnchor.constraint(equalToConstant: 250),
            explosionImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            explosionImageView.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 30),
            
            questLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            questLabel.topAnchor.constraint(equalTo: explosionImageView.bottomAnchor, constant: 30),
            
            nextQuestButton.heightAnchor.constraint(equalToConstant: 80),
            nextQuestButton.widthAnchor.constraint(equalToConstant: 275),
            nextQuestButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextQuestButton.topAnchor.constraint(equalTo: questLabel.bottomAnchor, constant: 30),
            
            repeatButton.heightAnchor.constraint(equalToConstant: 80),
            repeatButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            repeatButton.topAnchor.constraint(equalTo: nextQuestButton.bottomAnchor, constant: 15),
            repeatButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
