//
//  CategoryRulesView.swift
//  BombApp
//
//  Created by Daria Arisova on 12.08.2023.
//

import UIKit

class CategoryRulesView: UIView/*, UICollectionViewDataSource, UICollectionViewDelegate, MyCollectionViewCellDelegate*/ {
    
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
    private var selectedItems: [String] = ["Природа", "Исскуство и Кино", "О Разном", "Спорт и Хобби"]
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionViewWidth - 20) / 2, height: (collectionViewWidth - 30) / 2)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isUserInteractionEnabled = false
        cv.isScrollEnabled = false
        cv.backgroundColor = .clear
        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var collectionViewWidth: CGFloat {
        return bounds.width / 2
    }
    
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
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.7
        paragraphStyle.alignment = .center
        categoriesAndQuestionsAvailableLabel.attributedText = NSAttributedString(string: "В игре доступно 6 категорий и более 90 вопросов.", attributes: [.paragraphStyle: paragraphStyle])
        categoriesThatCanBeChoosedLabel.attributedText = NSAttributedString(string: "Можно выбрать сразу несколько категорий для игры.", attributes: [.paragraphStyle: paragraphStyle])
        categoriesAndQuestionsAvailableLabel.numberOfLines = 0
        categoriesAndQuestionsAvailableLabel.textAlignment = .center
        categoriesThatCanBeChoosedLabel.numberOfLines = 0
        categoriesThatCanBeChoosedLabel.textAlignment = .center
        
        addSubview(categoryRulesLabel)
        addSubview(categoriesAndQuestionsAvailableLabel)
        addSubview(categoriesThatCanBeChoosedLabel)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        addSubview(collectionView)
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return text.count
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
//        let category = text[indexPath.row]
//        cell.delegate = self
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.blackColor.cgColor
//        cell.backgroundColor = UIColor(red: 129 / 255, green: 48 / 255, blue: 167 / 255, alpha: 1)
//        cell.configure(with: image[indexPath.row], title: category)
//        cell.selectButton.tag = indexPath.row
//        cell.layer.cornerRadius = 50
//        cell.layer.masksToBounds = true
//        cell.setSelectionState(isSelected: true)
//        
//        return cell
//    }
    
//    func didSelectItem(_ button: UIButton) {
//        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
//        let checkmark = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
//        button.setImage(checkmark?.withConfiguration(configuration), for: .normal)
//    }
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
            
//            collectionView.topAnchor.constraint(equalTo: categoriesThatCanBeChoosedLabel.bottomAnchor, constant: 10),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30),
        ])
    }
    
}


