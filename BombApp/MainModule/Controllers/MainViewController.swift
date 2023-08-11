import UIKit

class MainViewController: UIViewController {
    private var categoryCount = [String]()
    // bomb picture
    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bomb")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // start game button
    private lazy var startGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular24()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 40
        button.setTitle("Старт игры", for: .normal)
        button.addTarget(self, action: #selector(startGameButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // category button
    private lazy var categoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular24()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 40
        button.setTitle("Категории", for: .normal)
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // rules button
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
    
    // label игра компании
    private lazy var gameLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра для компании"
        label.textColor = .blackColor
        label.font = UIFont.delaGothicOneRegular32()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // label бомба название
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
        // Write code to push RulesViewController
        let vc = RulesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setConstraints() {
        view.addSubview(gameLabel)
        view.addSubview(bombLabel)
        view.addSubview(bombImageView)
        view.addSubview(startGameButton)
        view.addSubview(categoryButton)
        view.addSubview(rulesButton)
        
        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bombLabel.topAnchor.constraint(equalTo: gameLabel.bottomAnchor),
            bombLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bombLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bombImageView.topAnchor.constraint(equalTo: bombLabel.bottomAnchor),
            bombImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bombImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bombImageView.heightAnchor.constraint(equalToConstant: 400),
            
            startGameButton.topAnchor.constraint(equalTo: bombImageView.bottomAnchor),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            startGameButton.heightAnchor.constraint(equalToConstant: 75),
            
            categoryButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 15),
            categoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            categoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            categoryButton.heightAnchor.constraint(equalToConstant: 75),
            
            rulesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rulesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.widthAnchor.constraint(equalTo: rulesButton.heightAnchor)
        ])
    }
}
