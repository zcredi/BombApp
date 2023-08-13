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
    private var rulesLabelArray: [UILabel] = []
    private var rulesIndexBtnArray: [UIButton] = []
    private let rulesTextArray = [
        "Все игроки становятся в круг.",
        "Первый игрок берет телефон и нажимает кнопку:",
        "На экране появляется вопрос “Назовите Фрукт”.",
        "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники).",
        "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.",
        "Проигравшим считается тот, в чьих руках взорвалась бомба.",
        "Если в настройках выбран режим игры “С Заданиями”, то проигравший выполняет задание."
    ]
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        updateUI()
        setConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func updateUI() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(rulesLabel)
        addSubview(startGameButton)
        
        for i in 0...rulesTextArray.count - 1 {
            if (i + 1 == 7) {
                createRuleLabel(index: i, text: rulesTextArray[i], twoColored: true, textToColor: "“С Заданиями”")
            } else {
                createRuleLabel(index: i, text: rulesTextArray[i], twoColored: false, textToColor: "")
            }
            
            createRuleIndexBtn(index: i)
        }
    }
    
    private func createRuleLabel(index: Int, text: String, twoColored: Bool, textToColor: String) {
        rulesLabelArray.append(UILabel(
            text: text,
            font: UIFont.delaGothicOneRegular16()!,
            color: .blackColor
        ))
        rulesLabelArray[index].numberOfLines = 0
        rulesLabelArray[index].textAlignment = .center
        
        if twoColored {
            let string = NSMutableAttributedString(string: text)
            string.setColorForText(textToColor, with: .purpleColor)
            rulesLabelArray[index].attributedText = string
        }
        
        addSubview(rulesLabelArray[index])
    }
    
    private func createRuleIndexBtn(index: Int) {
        rulesIndexBtnArray.append(UIButton(type: .system))
        rulesIndexBtnArray[index].layer.borderWidth = 1
        rulesIndexBtnArray[index].layer.borderColor = UIColor.blackColor.cgColor
        rulesIndexBtnArray[index].titleLabel?.font = UIFont.delaGothicOneRegular12()
        rulesIndexBtnArray[index].tintColor = .yellowColor
        rulesIndexBtnArray[index].backgroundColor = .purpleColor
        rulesIndexBtnArray[index].layer.cornerRadius = 15
        rulesIndexBtnArray[index].setTitle("\(index + 1)", for: .normal)
        rulesIndexBtnArray[index].translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(rulesIndexBtnArray[index])
    }
}

extension RulesView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            rulesLabel.heightAnchor.constraint(equalToConstant: 115),
            rulesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
        
            rulesLabelArray[0].centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabelArray[0].topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 0),
            rulesLabelArray[0].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rulesLabelArray[0].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            rulesIndexBtnArray[0].topAnchor.constraint(equalTo: rulesLabelArray[0].topAnchor, constant: -2),
            rulesIndexBtnArray[0].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rulesIndexBtnArray[0].heightAnchor.constraint(equalToConstant: 31),
            rulesIndexBtnArray[0].widthAnchor.constraint(equalToConstant: 31),
            
            rulesLabelArray[1].centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabelArray[1].topAnchor.constraint(equalTo: rulesLabelArray[0].bottomAnchor, constant: 20),
            rulesLabelArray[1].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rulesLabelArray[1].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            rulesIndexBtnArray[1].topAnchor.constraint(equalTo: rulesLabelArray[1].topAnchor, constant: -2),
            rulesIndexBtnArray[1].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rulesIndexBtnArray[1].heightAnchor.constraint(equalToConstant: 31),
            rulesIndexBtnArray[1].widthAnchor.constraint(equalToConstant: 31),
            
            startGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startGameButton.topAnchor.constraint(equalTo: rulesLabelArray[1].bottomAnchor, constant: 10),
            startGameButton.heightAnchor.constraint(equalToConstant: 30),
            startGameButton.widthAnchor.constraint(equalToConstant: 110),
            
            rulesLabelArray[2].centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabelArray[2].topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 20),
            rulesLabelArray[2].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rulesLabelArray[2].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            rulesIndexBtnArray[2].topAnchor.constraint(equalTo: rulesLabelArray[2].topAnchor, constant: -2),
            rulesIndexBtnArray[2].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rulesIndexBtnArray[2].heightAnchor.constraint(equalToConstant: 31),
            rulesIndexBtnArray[2].widthAnchor.constraint(equalToConstant: 31),
            
            rulesLabelArray[3].centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabelArray[3].topAnchor.constraint(equalTo: rulesLabelArray[2].bottomAnchor, constant: 20),
            rulesLabelArray[3].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rulesLabelArray[3].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            rulesIndexBtnArray[3].topAnchor.constraint(equalTo: rulesLabelArray[3].topAnchor, constant: -2),
            rulesIndexBtnArray[3].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rulesIndexBtnArray[3].heightAnchor.constraint(equalToConstant: 31),
            rulesIndexBtnArray[3].widthAnchor.constraint(equalToConstant: 31),
            
            rulesLabelArray[4].centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabelArray[4].topAnchor.constraint(equalTo: rulesLabelArray[3].bottomAnchor, constant: 20),
            rulesLabelArray[4].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rulesLabelArray[4].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            rulesIndexBtnArray[4].topAnchor.constraint(equalTo: rulesLabelArray[4].topAnchor, constant: -2),
            rulesIndexBtnArray[4].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rulesIndexBtnArray[4].heightAnchor.constraint(equalToConstant: 31),
            rulesIndexBtnArray[4].widthAnchor.constraint(equalToConstant: 31),
            
            rulesLabelArray[5].centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabelArray[5].topAnchor.constraint(equalTo: rulesLabelArray[4].bottomAnchor, constant: 20),
            rulesLabelArray[5].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rulesLabelArray[5].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            rulesIndexBtnArray[5].topAnchor.constraint(equalTo: rulesLabelArray[5].topAnchor, constant: -2),
            rulesIndexBtnArray[5].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rulesIndexBtnArray[5].heightAnchor.constraint(equalToConstant: 31),
            rulesIndexBtnArray[5].widthAnchor.constraint(equalToConstant: 31),
            
            rulesLabelArray[6].centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabelArray[6].topAnchor.constraint(equalTo: rulesLabelArray[5].bottomAnchor, constant: 20),
            rulesLabelArray[6].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rulesLabelArray[6].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            rulesIndexBtnArray[6].topAnchor.constraint(equalTo: rulesLabelArray[6].topAnchor, constant: -2),
            rulesIndexBtnArray[6].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rulesIndexBtnArray[6].heightAnchor.constraint(equalToConstant: 31),
            rulesIndexBtnArray[6].widthAnchor.constraint(equalToConstant: 31),
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

