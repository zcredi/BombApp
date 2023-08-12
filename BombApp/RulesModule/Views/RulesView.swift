//
//  RulesView.swift
//  BombApp
//
//  Created by Rakhat on 08.08.2023.
//

import UIKit

class RulesView: UIView {
    
    private let rulesLabel = UILabel(text: "Правила игры",
                                     font: UIFont.delaGothicOneRegular32()!,
                                     color: .purpleColor)
    
    private let firstRule = UILabel(
        text: "Все игроки становятся в круг.",
        font: UIFont.delaGothicOneRegular16()!,
        color: .blackColor
    )
    private lazy var firstRuleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular16()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 16
        button.setTitle("1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let secondRule = UILabel(
        text: "Первый игрок берет телефон и нажимает кнопку:",
        font: UIFont.delaGothicOneRegular16()!,
        color: .blackColor
    )
    private lazy var secondRuleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular16()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 16
        button.setTitle("2", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // start game button
    private lazy var startGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular12()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 15
        button.setTitle("Старт игры", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let thirdRule = UILabel(
        text: "На экране появляется вопрос “Назовите Фрукт”.",
        font: UIFont.delaGothicOneRegular16()!,
        color: .blackColor
    )
    private lazy var thirdRuleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular16()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 16
        button.setTitle("3", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let fourthRule = UILabel(
        text: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники).",
        font: UIFont.delaGothicOneRegular16()!,
        color: .black
    )
    private lazy var fourthRuleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular16()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 16
        button.setTitle("4", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let fifthRule = UILabel(
        text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.",
        font: UIFont.delaGothicOneRegular16()!,
        color: .blackColor
    
    )
    private lazy var fifthRuleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular16()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 16
        button.setTitle("5", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let sixthRule = UILabel(
        text: "Проигравшим считается тот, в чьих руках взорвалась бомба.",
        font: UIFont.delaGothicOneRegular16()!,
        color: .blackColor
    )
    private lazy var sixthRuleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular16()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 16
        button.setTitle("6", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let seventhRule = UILabel(
        text: "",
        font: UIFont.delaGothicOneRegular16()!,
        color: .blackColor
    )
    private lazy var seventhRuleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular16()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 16
        button.setTitle("7", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        updateUI()
        setConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func updateUI() {
        let string = NSMutableAttributedString(string: "Если в настройках выбран режим игры “С Заданиями”, то проигравший выполняет задание.")
        string.setColorForText("“С Заданиями”", with: .purpleColor)
        seventhRule.attributedText = string
        
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(rulesLabel)
        firstRule.numberOfLines = 0
        fifthRule.textAlignment = .center
        secondRule.numberOfLines = 0
        secondRule.textAlignment = .center
        thirdRule.numberOfLines = 0
        thirdRule.textAlignment = .center
        fourthRule.numberOfLines = 0
        fourthRule.textAlignment = .center
        fifthRule.numberOfLines = 0
        fifthRule.textAlignment = .center
        sixthRule.numberOfLines = 0
        sixthRule.textAlignment = .center
        seventhRule.numberOfLines = 0
        seventhRule.textAlignment = .center
        addSubview(firstRule)
        addSubview(firstRuleButton)
        addSubview(secondRule)
        addSubview(secondRuleButton)
        addSubview(startGameButton)
        addSubview(thirdRule)
        addSubview(thirdRuleButton)
        addSubview(fourthRule)
        addSubview(fourthRuleButton)
        addSubview(fifthRule)
        addSubview(fifthRuleButton)
        addSubview(sixthRule)
        addSubview(sixthRuleButton)
        addSubview(seventhRule)
        addSubview(seventhRuleButton)
    }
}

extension RulesView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            rulesLabel.heightAnchor.constraint(equalToConstant: 115),
            rulesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
        
            firstRule.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstRule.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 0),
            firstRule.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            firstRule.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            firstRuleButton.topAnchor.constraint(equalTo: firstRule.topAnchor, constant: -2),
            firstRuleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            firstRuleButton.heightAnchor.constraint(equalToConstant: 31),
            firstRuleButton.widthAnchor.constraint(equalToConstant: 31),
            
            secondRule.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondRule.topAnchor.constraint(equalTo: firstRule.bottomAnchor, constant: 20),
            secondRule.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            secondRule.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            secondRuleButton.topAnchor.constraint(equalTo: secondRule.topAnchor, constant: -2),
            secondRuleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            secondRuleButton.heightAnchor.constraint(equalToConstant: 31),
            secondRuleButton.widthAnchor.constraint(equalToConstant: 31),
            
            startGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startGameButton.topAnchor.constraint(equalTo: secondRule.bottomAnchor, constant: 10),
            startGameButton.heightAnchor.constraint(equalToConstant: 30),
            startGameButton.widthAnchor.constraint(equalToConstant: 110),
            
            thirdRule.centerXAnchor.constraint(equalTo: centerXAnchor),
            thirdRule.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 20),
            thirdRule.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            thirdRule.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            thirdRuleButton.topAnchor.constraint(equalTo: thirdRule.topAnchor, constant: -2),
            thirdRuleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            thirdRuleButton.heightAnchor.constraint(equalToConstant: 31),
            thirdRuleButton.widthAnchor.constraint(equalToConstant: 31),
            
            fourthRule.centerXAnchor.constraint(equalTo: centerXAnchor),
            fourthRule.topAnchor.constraint(equalTo: thirdRule.bottomAnchor, constant: 20),
            fourthRule.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            fourthRule.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            fourthRuleButton.topAnchor.constraint(equalTo: fourthRule.topAnchor, constant: -2),
            fourthRuleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            fourthRuleButton.heightAnchor.constraint(equalToConstant: 31),
            fourthRuleButton.widthAnchor.constraint(equalToConstant: 31),
            
            fifthRule.centerXAnchor.constraint(equalTo: centerXAnchor),
            fifthRule.topAnchor.constraint(equalTo: fourthRule.bottomAnchor, constant: 20),
            fifthRule.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            fifthRule.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            fifthRuleButton.topAnchor.constraint(equalTo: fifthRule.topAnchor, constant: -2),
            fifthRuleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            fifthRuleButton.heightAnchor.constraint(equalToConstant: 31),
            fifthRuleButton.widthAnchor.constraint(equalToConstant: 31),
            
            sixthRule.centerXAnchor.constraint(equalTo: centerXAnchor),
            sixthRule.topAnchor.constraint(equalTo: fifthRule.bottomAnchor, constant: 20),
            sixthRule.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            sixthRule.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            sixthRuleButton.topAnchor.constraint(equalTo: sixthRule.topAnchor, constant: -2),
            sixthRuleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            sixthRuleButton.heightAnchor.constraint(equalToConstant: 31),
            sixthRuleButton.widthAnchor.constraint(equalToConstant: 31),
            
            seventhRule.centerXAnchor.constraint(equalTo: centerXAnchor),
            seventhRule.topAnchor.constraint(equalTo: sixthRule.bottomAnchor, constant: 20),
            seventhRule.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            seventhRule.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            seventhRuleButton.topAnchor.constraint(equalTo: seventhRule.topAnchor, constant: -2),
            seventhRuleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            seventhRuleButton.heightAnchor.constraint(equalToConstant: 31),
            seventhRuleButton.widthAnchor.constraint(equalToConstant: 31),
        ])
    }
    
}

extension NSMutableAttributedString {
    func setColorForText(_ textToFind: String?, with color: UIColor) {
        let range:NSRange?
        
        if let text = textToFind {
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        } else {
            range = NSMakeRange(0, self.length)
        }
        
        if range!.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range!)
        }
    }
}

