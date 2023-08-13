import UIKit

extension UIView {
    
     func addShadowOnView() {
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1
    }
}
