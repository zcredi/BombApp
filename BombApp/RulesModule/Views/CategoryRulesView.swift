//
//  CategoryRulesView.swift
//  BombApp
//
//  Created by Daria Arisova on 12.08.2023.
//

import UIKit

class CategoryRulesView: UIView {
    
    private let categoryRulesLabel = UILabel(
        text: "Категории",
        font: UIFont.delaGothicOneRegular32()!,
        color: .purpleColor
    )
    private let categoriesAndQuestionsAvailableLabel = UILabel(
        text: "",
        font: UIFont.delaGothicOneRegular24()!,
        color: .black
    )
    private let categoriesThatCanBeChoosedLabel = UILabel(
        text: "",
        font: UIFont.delaGothicOneRegular24()!,
        color: .black
    )
    private let text: [String] = ["Природа", "Исскуство и Кино", "О Разном", "Спорт и Хобби"]
    private let image: [UIImage] = [UIImage(named: "image6")!, UIImage(named: "image5")!, UIImage(named: "image1")!, UIImage(named: "image2")!]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        updateUI()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func updateUI(){
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(categoryRulesLabel)
        addSubview(getLabelsWithLineHeight(label: categoriesAndQuestionsAvailableLabel, text: "В игре доступно 6 категорий и более 90 вопросов."))
        addSubview(getLabelsWithLineHeight(label: categoriesThatCanBeChoosedLabel, text: "Можно выбрать сразу несколько категорий для игры."))
        addCategoriesBlock()
    }
    
    private func getLabelsWithLineHeight(label: UILabel, text: String) -> UILabel {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.7
        paragraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: text, attributes: [.paragraphStyle: paragraphStyle])
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }
    
    private func addCategoriesBlock() {
        for i in 0...text.count - 1 {
            let categoryViewBlock = UIButton(type: .system)
            categoryViewBlock.layer.borderWidth = 1
            categoryViewBlock.layer.borderColor = UIColor.blackColor.cgColor
            categoryViewBlock.backgroundColor = UIColor(red: 129 / 255, green: 48 / 255, blue: 167 / 255, alpha: 1)
            categoryViewBlock.layer.cornerRadius = 50
            categoryViewBlock.translatesAutoresizingMaskIntoConstraints = false
            
            let label = UILabel()
            label.numberOfLines = 0
            label.textColor = .yellowColor
            label.font = UIFont.delaGothicOneRegular12()
            label.textAlignment = .center
            label.textColor = .yellowColor
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = text[i]
            
            let selectButton = UIButton(type: .system)
            selectButton.isEnabled = false
            selectButton.setTitle("", for: .normal)
            let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
            let checkImage = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            selectButton.setImage(checkImage?.withConfiguration(configuration), for: .normal)
            selectButton.translatesAutoresizingMaskIntoConstraints = false
            
            let myImageView = UIImageView()
            myImageView.contentMode = .scaleAspectFit
            myImageView.translatesAutoresizingMaskIntoConstraints = false
            myImageView.image = image[i]
            
            let blockSize: Float = 145.0
            let blockTopConst: Float = i < 2 ? 15.0 : blockSize + 35.0
            let blockLeadingConst: Float = i == 0 || i == 2 ? 30.0 : blockSize + 50.0
            
            addSubview(categoryViewBlock)
            categoryViewBlock.addSubview(label)
            categoryViewBlock.addSubview(myImageView)
            categoryViewBlock.addSubview(selectButton)
            
            NSLayoutConstraint.activate([
                categoryViewBlock.widthAnchor.constraint(equalToConstant: 145),
                categoryViewBlock.heightAnchor.constraint(equalToConstant: 145),
                categoryViewBlock.topAnchor.constraint(equalTo: categoriesThatCanBeChoosedLabel.bottomAnchor, constant: CGFloat(blockTopConst)),
                categoryViewBlock.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(blockLeadingConst)),
                
                selectButton.topAnchor.constraint(equalTo: categoryViewBlock.topAnchor, constant: 10),
                selectButton.leadingAnchor.constraint(equalTo: categoryViewBlock.leadingAnchor, constant: 10),
                
                myImageView.topAnchor.constraint(equalTo: categoryViewBlock.topAnchor, constant: 20),
                myImageView.centerXAnchor.constraint(equalTo: categoryViewBlock.centerXAnchor),
                myImageView.heightAnchor.constraint(equalTo: categoryViewBlock.heightAnchor, multiplier: 0.6),
                
                label.topAnchor.constraint(equalTo: myImageView.bottomAnchor),
                label.leadingAnchor.constraint(equalTo: categoryViewBlock.leadingAnchor, constant: 15),
                label.trailingAnchor.constraint(equalTo: categoryViewBlock.trailingAnchor, constant: -15),
                label.bottomAnchor.constraint(equalTo: categoryViewBlock.bottomAnchor, constant: -3),
            ])
            
        }
    }
}

extension CategoryRulesView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            categoryRulesLabel.heightAnchor.constraint(equalToConstant: 115),
            categoryRulesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryRulesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            
            categoriesAndQuestionsAvailableLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoriesAndQuestionsAvailableLabel.heightAnchor.constraint(equalToConstant: 100),
            categoriesAndQuestionsAvailableLabel.topAnchor.constraint(equalTo: categoryRulesLabel.bottomAnchor, constant: 0),
            categoriesAndQuestionsAvailableLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            categoriesAndQuestionsAvailableLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            categoriesThatCanBeChoosedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoriesThatCanBeChoosedLabel.heightAnchor.constraint(equalToConstant: 100),
            categoriesThatCanBeChoosedLabel.topAnchor.constraint(equalTo: categoriesAndQuestionsAvailableLabel.bottomAnchor, constant: 45),
            categoriesThatCanBeChoosedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            categoriesThatCanBeChoosedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        ])
    }
    
}


