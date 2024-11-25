import UIKit

protocol CreateProductDelegate: AnyObject {
    func publish(product: ProductModel)
}

final class CreateProduct: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var product = ProductModel(
        product: 0,
        available_quantity: 0,
        price: 0
    )
    
    weak var delegate: CreateProductDelegate?
    
    private lazy var tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
    
    private let mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    private let mainContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let productNameLabel = CustomLabel(text: "Product Name", color: .black, fontSize: 16)
    private let productNameTextField = TextFieldView(placeH: "Product name", width: 300)
    
    private let priceLabel = CustomLabel(text: "Price", color: .black, fontSize: 16)
    private let priceTextField = TextFieldView(placeH: "Price in dollars", width: 300)
    
    private let quantityLabel = CustomLabel(text: "Quantity", color: .black, fontSize: 16)
    private let quantityTextField = TextFieldView(placeH: "In units", width: 300)
    
    private let descriptionLabel = CustomLabel(text: "Description", color: .black, fontSize: 16)
    private let descriptionTextField = TextFieldView(placeH: "Description of your product", width: 300)
    
    private let publishButton = CustomButton()
}

private extension CreateProduct {
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setupConstraints()
        setupButton(publishButton, #selector(publishButtonPressed), "PUBLISH", .white, UIColor(named: "Color")!, 300)
        publishButton.isEnabled = true
    }
    
    private func addSubviews() {
        
        addGestureRecognizer(tap)
        
        addSubview(mainScrollView)
        
        mainScrollView.addSubview(mainContentView)
        
        mainContentView.addSubview(productNameLabel)
        mainContentView.addSubview(productNameTextField)
        
        mainContentView.addSubview(priceLabel)
        mainContentView.addSubview(priceTextField)
        
        mainContentView.addSubview(quantityLabel)
        mainContentView.addSubview(quantityTextField)
        
        mainContentView.addSubview(descriptionLabel)
        mainContentView.addSubview(descriptionTextField)
        
        mainContentView.addSubview(publishButton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainScrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mainContentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            mainContentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainContentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainContentView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor),
            
            //product
            productNameLabel.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 20),
            productNameLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 35),
            
            productNameTextField.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 15),
            productNameTextField.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            
            //price
            priceLabel.topAnchor.constraint(equalTo: productNameTextField.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 35),
            
            priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
            priceTextField.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            
            //quanity
            quantityLabel.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 20),
            quantityLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 35),
            
            quantityTextField.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 15),
            quantityTextField.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            
            //description
            descriptionLabel.topAnchor.constraint(equalTo: quantityTextField.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 35),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            descriptionTextField.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            
            //publish button
            publishButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 40),
            publishButton.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor)
        ])
    }
    
}

extension CreateProduct {
    private func setupButton(_ button: UIButton, _ action: Selector, _ title: String, _ color: UIColor, _ backgroundColor: UIColor, _ width: CGFloat) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = backgroundColor
        button.isEnabled = false
        button.addTarget(self, action: action, for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
    }
    
    @objc private func publishButtonPressed() {
        product.product = Int(productNameTextField.text!) ?? 0
        product.price = Int(priceTextField.text!) ?? 0
        product.available_quantity = Int(quantityTextField.text!) ?? 0
        
        delegate?.publish(product: product)
    }
}
