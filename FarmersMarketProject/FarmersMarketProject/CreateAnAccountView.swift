
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
        stack.addArrangedSubview(farmerButton)
        stack.addArrangedSubview(buyerButton)
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
    private lazy var farmerButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("FARMER", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "Color")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.addTarget(self, action: #selector(farmerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buyerButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("BUYER", for: .normal)
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 3.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.addTarget(self, action: #selector(farmerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - FUNCTIONS
    @objc private func farmerButtonPressed() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(deliveryPhoto)
        view.addSubview(stackOfButton)
        
        NSLayoutConstraint.activate([
            deliveryPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deliveryPhoto.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -100),
            
            stackOfButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackOfButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
