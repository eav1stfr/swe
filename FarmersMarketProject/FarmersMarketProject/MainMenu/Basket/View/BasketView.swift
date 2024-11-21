import UIKit

protocol BasketViewDelegate: AnyObject {
    func makeOrder(listOfProducts: [BasketProductModel])
}


final class BasketView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private var products: [BasketProductModel] = []
    
    private let summaryView = PaymentSummaryView()
    
    weak var delegate: BasketViewDelegate?
    
    private let orderButton = CustomButton()
}

private extension BasketView {
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(mainScrollView)
        
        mainScrollView.addSubview(mainContentView)
        
        mainContentView.addSubview(summaryView)
        mainContentView.addSubview(orderButton)
        
        setupButton(orderButton, #selector(orderNowButtonPressed), "ORDER NOW", .white, UIColor(named: "Color")!, 300)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainScrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainScrollView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            mainContentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            mainContentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainContentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainContentView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor),
            mainContentView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            
            summaryView.centerYAnchor.constraint(equalTo: mainContentView.centerYAnchor),
            summaryView.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            summaryView.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 10),
            summaryView.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -10),
            summaryView.heightAnchor.constraint(equalToConstant: 200),
            
            orderButton.topAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: 20),
            orderButton.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor)
        ])
    }
    
}

private extension BasketView {
    private func setupButton(_ button: UIButton, _ action: Selector, _ title: String, _ color: UIColor, _ backgroundColor: UIColor, _ width: CGFloat) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = backgroundColor
        button.isEnabled = false
        button.addTarget(self, action: action, for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.isEnabled = true
    }
    
    @objc private func orderNowButtonPressed() {
        delegate?.makeOrder(listOfProducts: products)
    }
}

