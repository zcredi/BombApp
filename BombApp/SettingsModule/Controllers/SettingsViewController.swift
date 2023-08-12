import UIKit

class SettingsViewController: UIViewController {
    private let timeLabel = UILabel(text: "Время игры",
                                    font: .delaGothicOneRegular20(),
                                    color: .purpleColor)
    private let challengeLabel = UILabel(text: "Игра с Заданиями",
                                         font: .delaGothicOneRegular20(),
                                         color: .purpleColor)
    private let music = UILabel(text: "Фоновая музыка",
                                font: .delaGothicOneRegular20(),
                                color: .purpleColor)
    private let musicLabel = UILabel(text: "Фоновая музыка",
                                     font: .delaGothicOneRegular20(),
                                     color: .purpleColor)
    private let tickingBomb = UILabel(text: "Тиканье Бомбы",
                                      font: .delaGothicOneRegular20(),
                                      color: .purpleColor)
    private let bombBlast = UILabel(text: "Взрыв бомбы",
                                    font: .delaGothicOneRegular20(),
                                    color: .purpleColor)
    
    private lazy var settingsSV: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 5
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var row1StackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        timeLabel.textAlignment = .left
        sv.addArrangedSubview(timeLabel)
        sv.addArrangedSubview(segmentedGame)
        return sv
    }()
    
    
    private lazy var gameWithTasks: UISwitch = {
        let switchChallenge = UISwitch()
        switchChallenge.tag = 0
        switchChallenge.onTintColor = .purpleColor
        switchChallenge.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switchChallenge.translatesAutoresizingMaskIntoConstraints = false
        return switchChallenge
    }()
    
    
    private lazy var backgroundMusic: UISwitch = {
        let switchChallenge = UISwitch()
        switchChallenge.tag = 1
        switchChallenge.onTintColor = .purpleColor
        switchChallenge.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switchChallenge.translatesAutoresizingMaskIntoConstraints = false
        return switchChallenge
    }()
    private lazy var segmentedGame: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Короткое", "Среднее", "Длинное", "Случайное"])
        segment.selectedSegmentIndex = 0
        segment.selectedSegmentTintColor = .purpleColor
        
        return segment
    }()
    
    private lazy var row2StackView: UIStackView = {
        let sv = UIStackView()
        let svView = UIView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.addArrangedSubview(challengeLabel)
        sv.addArrangedSubview(svView)
        challengeLabel.numberOfLines = 1
        challengeLabel.textAlignment = .center
        svView.addSubview(gameWithTasks)
        NSLayoutConstraint.activate([
            gameWithTasks.topAnchor.constraint(equalTo: svView.topAnchor, constant: 30),
            gameWithTasks.trailingAnchor.constraint(equalTo: svView.trailingAnchor, constant: -30),
            gameWithTasks.bottomAnchor.constraint(equalTo: svView.bottomAnchor, constant: -10),
        ])
        settingsSV.addArrangedSubview(sv)
        return sv
    }()
    
    private lazy var row3StackView: UIStackView = {
        let sv = UIStackView()
        let svView = UIView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        music.numberOfLines = 1
        music.textAlignment = .center
        sv.addArrangedSubview(music)
        sv.addArrangedSubview(svView)
        svView.addSubview(backgroundMusic)
        NSLayoutConstraint.activate([
            backgroundMusic.topAnchor.constraint(equalTo: svView.topAnchor, constant: 30),
            backgroundMusic.trailingAnchor.constraint(equalTo: svView.trailingAnchor, constant: -30),
            backgroundMusic.bottomAnchor.constraint(equalTo: svView.bottomAnchor, constant: -10)
        ])
        settingsSV.addArrangedSubview(sv)
        return sv
    }()
    
    private lazy var row4StackView: UIStackView = {
        let sv = UIStackView()
        let svView = UIView()
        let label = UILabel(text: "Мелодия3", font: .delaGothicOneRegular16(), color: .blackColor)
        musicLabel.numberOfLines = 1
        musicLabel.textAlignment = .center
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.addArrangedSubview(musicLabel)
        sv.addArrangedSubview(svView)
        svView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: svView.topAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: svView.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: svView.bottomAnchor, constant: -20)
        ])
        return sv
    }()
    
    private lazy var row5StackView: UIStackView = {
        let sv = UIStackView()
        let svView = UIView()
        let label = UILabel(text: "Часы2", font: .delaGothicOneRegular16(), color: .blackColor)
        tickingBomb.textAlignment = .center
        tickingBomb.numberOfLines = 1
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.addArrangedSubview(tickingBomb)
        sv.addArrangedSubview(svView)
        svView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: svView.topAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: svView.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: svView.bottomAnchor, constant: -20)
        ])
        return sv
    }()
    
    private lazy var row6StackView: UIStackView = {
        let sv = UIStackView()
        let svView = UIView()
        let label = UILabel(text: "Взрыв1", font: .delaGothicOneRegular16(), color: .blackColor)
        musicLabel.textAlignment = .center
        musicLabel.numberOfLines = 1
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.addArrangedSubview(bombBlast)
        sv.addArrangedSubview(svView)
        svView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: svView.topAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: svView.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: svView.bottomAnchor, constant: -20)
        ])
        return sv
    }()
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var segmentedIndex = UserDefaults.standard.integer(forKey: "GameTime")
        switch segmentedIndex{
            case 15: segmentedGame.selectedSegmentIndex = 0
            case 30: segmentedGame.selectedSegmentIndex = 1
            case 60: segmentedGame.selectedSegmentIndex = 2
            case 15...60: segmentedGame.selectedSegmentIndex = 3
            default: break
        }
        gameWithTasks.setOn(UserDefaults.standard.bool(forKey: "gameWithChallenge"), animated: true)
        backgroundMusic.setOn(UserDefaults.standard.bool(forKey: "gameWithMusic"), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        createCustomNavigationBar()
        let sceneTitleView = createCustomTitleView(sceneTitle: "Настройки")
        self.navigationItem.titleView = sceneTitleView
        view.addSubview(settingsSV)
        settingsSV.addArrangedSubview(row1StackView)
        settingsSV.addArrangedSubview(row2StackView)
        settingsSV.addArrangedSubview(row3StackView)
        settingsSV.addArrangedSubview(row4StackView)
        settingsSV.addArrangedSubview(row5StackView)
        settingsSV.addArrangedSubview(row6StackView)
        
        NSLayoutConstraint.activate([
            settingsSV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsSV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsSV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        switch segmentedGame.selectedSegmentIndex {
            case 0: UserDefaults.standard.set(15, forKey: "GameTime")
            case 1: UserDefaults.standard.set(30, forKey: "GameTime")
            case 2: UserDefaults.standard.set(60, forKey: "GameTime")
            case 3: UserDefaults.standard.set(Int.random(in: 15...60), forKey: "GameTime")
            default: break
        }
        
        
    }
    @IBAction func switchValueChanged(_ sender: UISwitch){
        
        var value = sender.isOn
        print(value)
        switch sender.tag{
            case 0: UserDefaults.standard.set(value, forKey: "gameWithChallenge")
            case 1: UserDefaults.standard.set(value, forKey: "gameWithMusic")
            default: break
        }
    }
}
