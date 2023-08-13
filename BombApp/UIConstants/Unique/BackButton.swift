import UIKit

class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        setBackgroundImage(UIImage(named: "arrow"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
