import UIKit

class GameStartView: UIView {
    
    let gameLabel = UILabel(text: "Нажмите “Запустить” чтобы начать игру",
                                    font: .delaGothicOneRegular32(),
                                    color: .purpleColor)
    
    lazy var startButton = PurpleButton(text: "Запустить")
    
    let bombImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "gameBomb")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        addSubview(gameLabel)
        addSubview(bombImageView)
        addSubview(startButton)
        startButton.addTarget(nil, action: #selector(GameViewController.startButtonPressed), for: .touchUpInside)
    }
}

extension GameStartView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            gameLabel.heightAnchor.constraint(equalToConstant: 115),
            gameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            gameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            gameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
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
