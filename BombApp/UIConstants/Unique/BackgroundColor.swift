import UIKit

extension UIViewController {
    func addGradientBackground(topColor: UIColor, bottomColor: UIColor) {
        // Create Gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        // Get Color gradient
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        
        // Specify the points where the gradient should be visible
        gradientLayer.locations = [0.0, 1.0]
        
        // Gradient direction
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        // Add a gradient layer to the view
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
