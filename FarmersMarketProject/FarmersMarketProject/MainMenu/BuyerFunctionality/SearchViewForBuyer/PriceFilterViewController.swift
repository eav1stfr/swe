import UIKit

class PriceFilterViewController: UIViewController {
    // UI elements
    let minPriceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Min Price"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let maxPriceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Max Price"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apply", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var onApply: ((Int, Int) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        // Add UI elements to the view
        view.addSubview(minPriceTextField)
        view.addSubview(maxPriceTextField)
        view.addSubview(applyButton)

        // Set up constraints
        NSLayoutConstraint.activate([
            minPriceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minPriceTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            minPriceTextField.widthAnchor.constraint(equalToConstant: 200),
            minPriceTextField.heightAnchor.constraint(equalToConstant: 40),

            maxPriceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            maxPriceTextField.topAnchor.constraint(equalTo: minPriceTextField.bottomAnchor, constant: 20),
            maxPriceTextField.widthAnchor.constraint(equalToConstant: 200),
            maxPriceTextField.heightAnchor.constraint(equalToConstant: 40),

            applyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applyButton.topAnchor.constraint(equalTo: maxPriceTextField.bottomAnchor, constant: 30),
            applyButton.widthAnchor.constraint(equalToConstant: 100),
            applyButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Add action to the button
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
    }
    
    @objc func applyButtonTapped() {
        let min = Int(minPriceTextField.text ?? "") ?? 0  // Default to 0 if nil
        let max = Int(maxPriceTextField.text ?? "") ?? 10000  // Default to 10000 if nil

        onApply?(min, max)
        dismiss(animated: true, completion: nil)
    }

}

