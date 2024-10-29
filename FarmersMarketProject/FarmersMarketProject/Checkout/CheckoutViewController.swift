import UIKit

final class CheckoutViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.canCancelContentTouches = false
        return scrollView
    }()
    
    
    private let mainContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.
        return view
    }()
    
    private let fullNameTextField = TextFieldView(placeH: "Full Name", width: 300)
    private let fullNameLabel = CustomLabel(text: "Full Name", color: .black, fontSize: 16)
    
    private let emailAddressTextField = TextFieldView(placeH: "alexandr.em@nu.edu.kz", width: 300)
    private let emailAddressLabel = CustomLabel(text: "Email Address", color: .black, fontSize: 16)
    
    private let phoneNumberTextField = TextFieldView(placeH: "+7-777-111-34-77", width: 300)
    private let phoneNumberLabel = CustomLabel(text: "Phone Number", color: .black, fontSize: 16)
    
    private let addressTextField = TextFieldView(placeH: "Type your home address", width: 300)
    private let addressLabel = CustomLabel(text: "Address", color: .black, fontSize: 16)
    
    private let zipTextField = TextFieldView(placeH: "Enter ZIP", width: 150)
    private let zipLabel = CustomLabel(text: "Zip Code", color: .black, fontSize: 16)
    
    private let cityTextField = TextFieldView(placeH: "e.g., Astana", width: 150)
    private let cityLabel = CustomLabel(text: "City", color: .black, fontSize: 16)
    
    private let countryLabel = CustomLabel(text: "Country", color: .black, fontSize: 16)
    
    
    private lazy var stackForZipCode: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(zipLabel)
        stack.addArrangedSubview(zipTextField)
        return stack
    }()
    
    private lazy var stackForCity: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(cityLabel)
        stack.addArrangedSubview(cityTextField)
        return stack
    }()
    
    private lazy var stackOfStacks: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(stackForZipCode)
        stack.addArrangedSubview(stackForCity)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(mainContentView)
        
        mainContentView.addSubview(fullNameLabel)
        mainContentView.addSubview(fullNameTextField)
        
        mainContentView.addSubview(emailAddressLabel)
        mainContentView.addSubview(emailAddressTextField)
        
        mainContentView.addSubview(phoneNumberLabel)
        mainContentView.addSubview(phoneNumberTextField)
        
        mainContentView.addSubview(addressLabel)
        mainContentView.addSubview(addressTextField)
        
        mainContentView.addSubview(stackOfStacks)
        
        mainContentView.backgroundColor = .white
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            mainContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainContentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            fullNameLabel.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 35),
            
            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15),
            fullNameTextField.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            
            emailAddressLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 20),
            emailAddressLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 35),
            
            emailAddressTextField.topAnchor.constraint(equalTo: emailAddressLabel.bottomAnchor, constant: 15),
            emailAddressTextField.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            
            
            phoneNumberLabel.topAnchor.constraint(equalTo: emailAddressTextField.bottomAnchor, constant: 20),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 35),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 15),
            phoneNumberTextField.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            
            
            addressLabel.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 35),
            
            addressTextField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 15),
            addressTextField.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            
            stackOfStacks.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 40),
            stackOfStacks.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20)
        ])
    }
}

