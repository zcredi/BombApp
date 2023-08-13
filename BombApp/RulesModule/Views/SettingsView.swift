import UIKit

class SettingsView: UIView {
    
    private let rulesLabel = UILabel(text: "Настройки",
                                     font: UIFont.delaGothicOneRegular32()!,
                                     color: .purpleColor)
    
    private func createPurpleCircle() -> UIView {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .purpleColor
        circle.layer.cornerRadius = 5
        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: 10),
            circle.heightAnchor.constraint(equalToConstant: 10)
        ])
        return circle
    }

    private lazy var introLabel: UIStackView = {
        let circle = createPurpleCircle()
        let label = UILabel()
        label.text = "В настройках игры можно задать время взрыва бомбы:"
        label.font = .delaGothicOneRegular16()
        label.textColor = .black
        label.numberOfLines = 0
        let stack = UIStackView(arrangedSubviews: [circle, label])
        stack.spacing = 10
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    private let alsoInTheSettingsLabel = UILabel(text: "Так же в настройках можно:",
                                                 font: UIFont.delaGothicOneRegular20()!,
                                                 color: .purpleColor)
    
    private var settingsTimeChoices: [UIButton] = []
    
    private let settingsTimeDescriptions = [
        UILabel(text: "Бомба взорвется в течении 15 секунд",
                font: .delaGothicOneRegular16(),
                color: .black),
        UILabel(text: "Бомба взорвется в течении 30 секунд",
                font: .delaGothicOneRegular16(),
                color: .black),
        UILabel(text: "Бомба взорвется в течении 60 секунд",
                font: .delaGothicOneRegular16(),
                color: .black),
        UILabel(text: "Бомба взорвется в течении 15-60 секунд",
                font: .delaGothicOneRegular16(),
                color: .black)
    ]

    private lazy var alsoInTheSettingsText: [UIStackView] = {
        var stacks: [UIStackView] = []
        let texts = [
            "Включить/Отключить фоновую музыку",
            "Выбрать звуки для фоновой музыки, тиканья бомбы и взрыва"
        ]
        
        for text in texts {
            let circle = createPurpleCircle()
            let label = UILabel()
            label.numberOfLines = 0
            label.text = text
            label.font = .delaGothicOneRegular16()
            label.textColor = .black
            let stack = UIStackView(arrangedSubviews: [circle, label])
            stack.spacing = 10
            stack.axis = .horizontal
            stack.alignment = .center
            stacks.append(stack)
        }
        
        return stacks
    }()

    private var timeStacks: [UIStackView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButton(with title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular12()
        button.setTitleColor(.yellowColor, for: .normal)
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 15
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }
    
    private func setupViews() {
        settingsTimeChoices = [
            createButton(with: "Короткое"),
            createButton(with: "Среднее"),
            createButton(with: "Длинное"),
            createButton(with: "Случайное"),
        ]
        
        for (index, button) in settingsTimeChoices.enumerated() {
                let descriptionLabel = settingsTimeDescriptions[index]
                descriptionLabel.numberOfLines = 0
                
                button.widthAnchor.constraint(equalToConstant: 100).isActive = true
                
                let stack = UIStackView(arrangedSubviews: [button, descriptionLabel])
                stack.axis = .horizontal
                stack.spacing = 8
                stack.distribution = .fill
                stack.alignment = .center
                
                timeStacks.append(stack)
        }
        
        let mainStack = UIStackView(arrangedSubviews: [introLabel] + timeStacks + [alsoInTheSettingsLabel] + alsoInTheSettingsText)
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.alignment = .leading
        
        let scrollView = UIScrollView()
        scrollView.addSubview(mainStack)
        addSubview(scrollView)
        addSubview(rulesLabel)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            mainStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            
            
            rulesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            rulesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
    }
}
