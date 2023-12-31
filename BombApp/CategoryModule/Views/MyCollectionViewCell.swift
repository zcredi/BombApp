import UIKit

protocol MyCollectionViewCellDelegate: AnyObject {
    func didSelectItem(_ button: UIButton)
}

class MyCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: MyCollectionViewCellDelegate?

    static let identifier = "MyCell"
    
    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .yellowColor
        label.font = UIFont.delaGothicOneRegular16()
        label.textAlignment = .center
        label.textColor = .yellowColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = false
        button.setTitle("", for: .normal)
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let image = UIImage(systemName: "circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image?.withConfiguration(configuration), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(selectButton)

        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            selectButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            myImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),

            categoryLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
        ])
    }

  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func toggleSelectionState() {
        delegate?.didSelectItem(selectButton)
    }

    func configure(with image: UIImage, title: String) {
        myImageView.image = image
        categoryLabel.text = title
    }
    func setSelectionState(isSelected: Bool) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let imageCircle = UIImage(systemName: "circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let checkmark = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        if isSelected {
            selectButton.setImage(checkmark?.withConfiguration(configuration), for: .normal)
        } else {
            selectButton.setImage(imageCircle?.withConfiguration(configuration), for: .normal)
        }
    }
}
