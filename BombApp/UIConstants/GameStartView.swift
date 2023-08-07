//
//  GameStartView.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 07.08.2023.
//

import UIKit

class GameStartView: UIView {
    
    let titleLabel = UILabel(text: "Нажмите \"Запустить\" чтобы начать игру",
                             font: UIFont.delaGothicOneRegular28()!,
                             color: .purpleColor)
    
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
        addSubview(titleLabel)
    }
    
}

extension GameStartView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.heightAnchor.constraint(equalToConstant: 96),
            titleLabel.widthAnchor.constraint(equalToConstant: 329),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        
        
        
        
        
        
        ])
    }
}
