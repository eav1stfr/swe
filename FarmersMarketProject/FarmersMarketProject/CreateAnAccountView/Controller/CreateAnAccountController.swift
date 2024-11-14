import UIKit

final class CreateAccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private var createAccountScrollView = CreateAccountScrollView()
    
    private let createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

private extension CreateAccountViewController {
    private func setupView() {
        view.backgroundColor = .white
        createAccountScrollView.delegate = self
        //createAccountScrollView.delegate?.acceptedTerms = false
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(createAccountLabel)
        view.addSubview(createAccountScrollView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            createAccountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            createAccountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            createAccountScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            createAccountScrollView.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 10),
            createAccountScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            createAccountScrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

extension CreateAccountViewController: CreateAccountScrollViewDelegate {
//    var acceptedTerms: Bool {
//        get {
//            return acceptedTerms
//
//        }
//        set {
//            acceptedTerms = false
//        }
//    }
    
    func alreadyHaveAccountPressed() {
        print("already have account button pressed")
    }
    
    func acceptRulesButtonDelegate() {
        
    }
    
    func continueButtonPressed() {
        print("continue button pressed")
    }
}

extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        createAccountScrollView.passwordTextField.endEditing(true)
        createAccountScrollView.emailTextField.endEditing(true)
        createAccountScrollView.usernameTextField.endEditing(true)
        createAccountScrollView.surnameTextField.endEditing(true)
        createAccountScrollView.nameTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
