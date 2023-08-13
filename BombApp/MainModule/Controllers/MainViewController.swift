import UIKit

class MainViewController: UIViewController {
    var isStartButtonPressed: Bool = false
    
    private var categoryCount = [String]()
    private var questModel = QuestModel()
    
    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bomb")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var startGameButton: PurpleButton = {
        let button = PurpleButton(text: "Старт Игры")
        button.addTarget(self, action: #selector(startGameButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var continueButton = PurpleButton(text: "Продолжить")
    
    private lazy var categoryButton: PurpleButton = {
        let button = PurpleButton(text: "Категории")
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var settingsButton: PurpleButton = {
        let button = PurpleButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .specialPurpleColor
        let configuration = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
        let image = UIImage(systemName: "gearshape.fill")?.withTintColor(.yellowColor, renderingMode: .alwaysOriginal)
        button.setImage(image?.withConfiguration(configuration), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.purpleColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular20()
        button.tintColor = .purpleColor
        button.backgroundColor = .yellowColor
        button.layer.cornerRadius = 25
        button.setTitle("?", for: .normal)
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
    }()
    
    
    private lazy var gameLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра для компании"
        label.textColor = .blackColor
        label.font = UIFont.delaGothicOneRegular32()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var bombLabel: UILabel = {
        let label = UILabel()
        label.text = "Бомба"
        label.textColor = .purpleColor
        label.font = UIFont.delaGothicOneRegular48()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setConstraints()
    }
    
    @objc func startGameButtonTapped(_ sender: UIButton) {
        isStartButtonPressed = true
        categoryCount = UserDefaults.standard.array(forKey: "selectedCategories") as! [String]
        if categoryCount.isEmpty {
            let alertController = CustomAlertController(image: UIImage(named: "applicationLogo") ?? .add, title: "Ошибка", message: "Выберите минимум одну категорию для начала игры")
            alertController.modalPresentationStyle = .overCurrentContext
            alertController.modalTransitionStyle = .crossDissolve
            self.present(alertController, animated: true)
        } else {
            let vc = GameViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func categoryButtonTapped() {
        let vc = CategoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func rulesButtonTapped() {
        let vc = RulesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func continueButtonPressed() {
        let gameLabelText = UserDefaults.standard.string(forKey: "CurrentQuestion") as! String
        let secondsCount = UserDefaults.standard.integer(forKey: "SecondsCount") as! Int
        let playSound = UserDefaults.standard.bool(forKey: "gameWithMusic") as! Bool
        let gameVC = GameViewController()
        gameVC.questModel.createAnimationView()
        gameVC.isPlayMusic = playSound
        if isStartButtonPressed {
            gameVC.isContinueButtonPressed = true
            gameVC.isPaused = false
            gameVC.stopOrResumeGame()
            gameVC.currentQuestion = gameLabelText
            gameVC.gameStartView.gameLabel.text = gameLabelText
            gameVC.count = secondsCount
            
            navigationController?.pushViewController(gameVC, animated: true)
        }else{
            let alertController = CustomAlertController(image: UIImage(named: "applicationLogo") ?? .add, title: "Ошибка", message: "У вас сейчас нету активной игры")
            alertController.modalPresentationStyle = .overCurrentContext
            alertController.modalTransitionStyle = .crossDissolve
            self.present(alertController, animated: true)
        }
    }
    @objc func settingsButtonPressed(_ sender: UIButton){
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    private func setConstraints() {
        view.addSubview(gameLabel)
        view.addSubview(bombLabel)
        view.addSubview(bombImageView)
        view.addSubview(startGameButton)
        view.addSubview(continueButton)
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        view.addSubview(categoryButton)
        view.addSubview(rulesButton)
        view.addSubview(settingsButton)
        
        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            gameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bombLabel.topAnchor.constraint(equalTo: gameLabel.bottomAnchor),
            bombLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bombLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bombImageView.topAnchor.constraint(equalTo: bombLabel.bottomAnchor),
            bombImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bombImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bombImageView.heightAnchor.constraint(equalToConstant: 350),
            
            startGameButton.topAnchor.constraint(equalTo: bombImageView.bottomAnchor),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            startGameButton.heightAnchor.constraint(equalToConstant: 75),
            
            continueButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 15),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            continueButton.heightAnchor.constraint(equalToConstant: 75),
            
            categoryButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 15),
            categoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            categoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            categoryButton.heightAnchor.constraint(equalToConstant: 75),
            
            rulesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rulesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.widthAnchor.constraint(equalTo: rulesButton.heightAnchor),
            
            
            settingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            settingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            settingsButton.heightAnchor.constraint(equalToConstant: 50),
            settingsButton.widthAnchor.constraint(equalTo: settingsButton.heightAnchor)
            
        ])
    }
}
