
import Foundation
import UIKit

class CreateAnAccountView: UIViewController {
    //MARK: - REGULAR VARS
    //MARK: - VIEWS
    private lazy var stackOfButton: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.backgroundColor = .white
        stack.addArrangedSubview(farmerButtonCustom)
        stack.addArrangedSubview(buyerButtonCustom)
        return stack
    }()
    
    private let deliveryPhoto: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DeliveryImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/1.5).isActive = true
        image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5).isActive = true
        return image
    }()
    
    //MARK: - BUTTONS
    private let farmerButtonCustom = CustomButton()
    private let buyerButtonCustom = CustomButton()
    
    //MARK: - FUNCTIONS
    @objc private func farmerButtonPressed() {
        
    }
    
    @objc private func buyerButtonPressed() {
        
    }
    
    private func setupButton(_ button: UIButton, _ action: Selector, _ title: String, _ color: UIColor, _ backgroundColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = color
        button.backgroundColor = backgroundColor
        button.addTarget(self, action: action, for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(deliveryPhoto)
        view.addSubview(stackOfButton)
        
        setupButton(farmerButtonCustom, #selector(farmerButtonPressed), "FARMER", .white, UIColor(named: "Color") ?? .white)
        setupButton(buyerButtonCustom, #selector(buyerButtonPressed), "BUYER", .black, .white)
        buyerButtonCustom.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        buyerButtonCustom.layer.borderWidth = 3.0
        
        NSLayoutConstraint.activate([
            deliveryPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deliveryPhoto.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -100),
            
            stackOfButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackOfButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
