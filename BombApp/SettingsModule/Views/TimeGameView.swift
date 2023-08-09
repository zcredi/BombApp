//
//  TimeGameView.swift
//  BombApp
//
//  Created by Владислав on 08.08.2023.
//

import UIKit

class TimeGameView: UIView {
    enum Constants {
    }
    
    //MARK: - Create UI
    
    private lazy var timeLabel = UILabel(text: "Время игры", font: .delaGothicOneRegular20(), color: .purpleColor)
    
    private lazy var littleButton = PurpleButton(text: "Короткой")
    private lazy var mediumButton = PurpleButton(text: "Среднее")
    private lazy var longButton = PurpleButton(text: "Длинное")
    private lazy var randomButton = PurpleButton(text: "Случайное")
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        littleButton.addTarget(self, action: #selector(selectionButtonTapped), for: .touchUpInside)
        littleButton.backgroundColor = .yellowColor
        littleButton.tintColor = .specialPurpleColor
        littleButton.titleLabel?.font = .delaGothicOneRegular16()
        littleButton.layer.cornerRadius = 50
        mediumButton.addTarget(self, action: #selector(selectionButtonTapped), for: .touchUpInside)
        mediumButton.backgroundColor = .yellowColor
        mediumButton.tintColor = .specialPurpleColor
        mediumButton.layer.cornerRadius = 50
        mediumButton.titleLabel?.font = .delaGothicOneRegular16()
        longButton.addTarget(self, action: #selector(selectionButtonTapped), for: .touchUpInside)
        longButton.backgroundColor = .yellowColor
        longButton.tintColor = .specialPurpleColor
        longButton.layer.cornerRadius = 50
        longButton.titleLabel?.font = .delaGothicOneRegular16()
        randomButton.addTarget(self, action: #selector(selectionButtonTapped), for: .touchUpInside)
        randomButton.backgroundColor = .yellowColor
        randomButton.tintColor = .specialPurpleColor
        randomButton.layer.cornerRadius = 50
        randomButton.titleLabel?.font = .delaGothicOneRegular16()
    }
    
    private func setupViews() {
        backgroundColor = .red
        addSubview(timeLabel)
        addSubview(littleButton)
        addSubview(mediumButton)
        addSubview(longButton)
        addSubview(randomButton)
    }
    
    @objc
    private func selectionButtonTapped(_ sender: UIButton) {
        
        // Сбросить состояние всех кнопок
           littleButton.isSelected = false
           mediumButton.isSelected = false
           longButton.isSelected = false
           randomButton.isSelected = false

        
        // Сбросить цвет и обновить изначальный цвет
           littleButton.backgroundColor = .yellowColor
           littleButton.tintColor = .specialPurpleColor
           mediumButton.backgroundColor = .yellowColor
           mediumButton.tintColor = .specialPurpleColor
           longButton.backgroundColor = .yellowColor
           longButton.tintColor = .specialPurpleColor
           randomButton.backgroundColor = .yellowColor
           randomButton.tintColor = .specialPurpleColor
           
           sender.isSelected = true
           
           if sender.isSelected {
               sender.backgroundColor = .specialPurpleColor
               sender.tintColor = .yellowColor
           } else {
               sender.backgroundColor = .yellowColor
               sender.tintColor = .specialPurpleColor
           }
       }
    }


//MARK: - setConstraints

extension TimeGameView {
    private func setConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
        ])
        littleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            littleButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 23),
            littleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 57),
            littleButton.trailingAnchor.constraint(equalTo: mediumButton.leadingAnchor, constant: -5),
            littleButton.widthAnchor.constraint(equalToConstant: 148)
        ])
        mediumButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mediumButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 23),
            mediumButton.leadingAnchor.constraint(equalTo: littleButton.trailingAnchor, constant: 5),
            mediumButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            mediumButton.widthAnchor.constraint(equalToConstant: 148)
        ])
    }
}

