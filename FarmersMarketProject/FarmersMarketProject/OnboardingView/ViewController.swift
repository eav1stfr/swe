import UIKit

class ViewController: UIViewController {

    private var labels: [String] = ["Welcome to Farmer's Market!", "Hello", "Bro bro bro"]
    private var currentIndex = 0
    
    private lazy var nextButtonCustom = CustomButton()
    private let createAccountButtonCustom = CustomButton()
    private let loginButtonCustom = CustomButton()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("CREATE AN ACCOUNT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "Color")
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.borderWidth = 3.0
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    @objc private func createAccountButtonPressed(_ sender: UIButton) {
        let newViewController = CreateAnAccountView()
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }

    @objc private func nextButtonPressed() {
        currentIndex += 1
        
        UIView.animate(withDuration: 0.5, animations: { [self] in
            if currentIndex == 1 {
                self.currentLabel.alpha = 0
                self.nextLabel.alpha = 1
            } else if currentIndex == 2 {
                self.nextLabel.alpha = 0
                self.finalLabel.alpha = 1
                horizontalStackOfViews.bottomAnchor.constraint(equalTo: nextButtonCustom.topAnchor, constant: -100).isActive = true
            }
            switch currentIndex {
            case 0:
                progressViewOne.backgroundColor = UIColor(named: "ColorGreen")
                progressViewTwo.backgroundColor = UIColor(named: "LightGray")
                progressViewThree.backgroundColor = UIColor(named: "LightGray")
            case 1:
                progressViewTwo.backgroundColor = UIColor(named: "ColorGreen")
                progressViewOne.backgroundColor = UIColor(named: "LightGray")
                progressViewThree.backgroundColor = UIColor(named: "LightGray")
            case 2:
                progressViewOne.backgroundColor = UIColor(named: "LightGray")
                progressViewTwo.backgroundColor = UIColor(named: "LightGray")
                progressViewThree.backgroundColor = UIColor(named: "ColorGreen")
            default:
                progressViewOne.backgroundColor = UIColor(named: "LightGray")
                progressViewTwo.backgroundColor = UIColor(named: "LightGray")
                progressViewThree.backgroundColor = UIColor(named: "LightGray")
            }
        }, completion: { _ in
            self.currentLabel.removeFromSuperview()
        })
    }

    private let progressViewOne: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "ColorGreen")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }()

    private let progressViewTwo: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "LightGray")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }()

    private let progressViewThree: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "LightGray")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }()

    private lazy var horizontalStackOfViews: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        stack.addArrangedSubview(progressViewOne)
        stack.addArrangedSubview(progressViewTwo)
        stack.addArrangedSubview(progressViewThree)
        return stack
    }()

    private lazy var currentLabel: UILabel = {
        let label = UILabel()
        label.text = labels[currentIndex]
        label.textColor = UIColor(named: "Color")
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nextLabel: UILabel = {
        let label = UILabel()
        label.text = "We provide best quality\nProducts to your family!"
        label.textColor = UIColor(named: "Color")
        label.numberOfLines = 2
        label.alpha = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var finalLabel: UILabel = {
        let label = UILabel()
        label.text = "Fast and responsibily\ndelivery by our courir"
        label.textColor = UIColor(named: "Color")
        label.numberOfLines = 2
        label.alpha = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fruitBasketPhoto: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "FruitsImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/1.5).isActive = true
        image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5).isActive = true
        return image
    }()
    
    private let deliveryGuyPhoto: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DeliveryImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/1.5).isActive = true
        image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5).isActive = true
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupButton(_ button: UIButton, _ action: Selector, _ title: String, _ color: UIColor, _ backgroundColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = color
        button.backgroundColor = backgroundColor
        button.addTarget(self, action: action, for: .touchUpInside)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(fruitBasketPhoto)
        view.addSubview(currentLabel)
        view.addSubview(horizontalStackOfViews)
        view.addSubview(nextLabel)
        view.addSubview(nextButtonCustom)
        
        
        setupButton(nextButtonCustom, #selector(nextButtonPressed), "NEXT", .white, UIColor(named: "Color") ?? .white)

        NSLayoutConstraint.activate([
            fruitBasketPhoto.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -100),
            fruitBasketPhoto.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),

            currentLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            currentLabel.topAnchor.constraint(equalTo: fruitBasketPhoto.bottomAnchor, constant: -100),

            nextLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nextLabel.topAnchor.constraint(equalTo: fruitBasketPhoto.bottomAnchor, constant: -100),

            horizontalStackOfViews.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            horizontalStackOfViews.bottomAnchor.constraint(equalTo: nextButtonCustom.topAnchor, constant: -50),

            nextButtonCustom.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nextButtonCustom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        ])
    }
}
