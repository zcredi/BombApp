//
//  GaneEndView.swift
//  BombApp
//
//  Created by fullzoom on 09.08.2023.
//

import UIKit

class GameEndView: UIView {
    
    private let warningLabel = UILabel(text: "Проигравший выполняет задание",
                                       font: .delaGothicOneRegular24(),
                                       color: .blackColor)
    let questLabel = UILabel(text: "В следующем раунде после каждого ответа хлопать в ладоши",
                                     font: .delaGothicOneRegular20(),
                                     color: .purpleColor)
    
    private let explosionImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "explosion")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nextQuestButton = PurpleButton(text: "Другое задание")
    lazy var repeatButton = PurpleButton(text: "Начать заного")
    
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
        addSubview(warningLabel)
        addSubview(explosionImageView)
        questLabel.shadowColor = .blackColor
        questLabel.shadowOffset = CGSize(width: -0.5, height: -0.5)
        addSubview(questLabel)
        addSubview(nextQuestButton)
        nextQuestButton.addTarget(nil, action: #selector(GameEndViewController.nextQuestButtonPressed), for: .touchUpInside)
        addSubview(repeatButton)
        repeatButton.addTarget(nil, action: #selector(GameEndViewController.repeatButtonPressed), for: .touchUpInside)
    }
}

extension GameEndView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            warningLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            warningLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            warningLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            
            explosionImageView.heightAnchor.constraint(equalToConstant: 280),
            explosionImageView.widthAnchor.constraint(equalToConstant: 250),
            explosionImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            explosionImageView.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 30),
            
            questLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            questLabel.topAnchor.constraint(equalTo: explosionImageView.bottomAnchor, constant: 30),
            
            nextQuestButton.heightAnchor.constraint(equalToConstant: 80),
            nextQuestButton.widthAnchor.constraint(equalToConstant: 280),
            nextQuestButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextQuestButton.topAnchor.constraint(equalTo: questLabel.bottomAnchor, constant: 20),
            
            repeatButton.heightAnchor.constraint(equalToConstant: 80),
            repeatButton.widthAnchor.constraint(equalToConstant: 280),
            repeatButton.topAnchor.constraint(equalTo: nextQuestButton.bottomAnchor, constant: 15),
            repeatButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
