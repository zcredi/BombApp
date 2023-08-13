import UIKit

class PurpleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(text: String) {
        self.init(type: .system)
        
        setTitle(text, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .specialPurpleColor
        titleLabel?.font = .delaGothicOneRegular24()
        tintColor = .yellowColor
        layer.cornerRadius = 40
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
    }
}
