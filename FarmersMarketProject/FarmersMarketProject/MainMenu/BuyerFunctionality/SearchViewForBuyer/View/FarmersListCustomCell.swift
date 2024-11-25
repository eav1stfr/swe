import UIKit

final class FarmersListCustomCell: UITableViewCell {
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let dict: Dictionary<Int, String> = [1: "Banana", 3: "Apple", 4: "Orange", 5: "Grape", 6: "Mango", 7: "Carrot", 8: "Potato", 9: "Onion", 10: "Cucumber", 11: "Pepper", 12: "Button Mushroom", 13: "Portobello", 14: "Shiitake", 15: "Chantereller", 16: "Enoki", 17: "Milk", 18: "Cheese", 19: "Butter", 20: "Yogurt", 21: "Cream", 22: "Oatmeal"]
    
    private let farmerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    private let availableQuantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Quantity: "
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.setTitle("SELECT", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.backgroundColor = UIColor(named: "Color")!
        return button
    }()
}

extension FarmersListCustomCell {
    func set(cell: FarmerSellingProduct) {
        farmerNameLabel.text = cell.farmer_name
        if dict.keys.contains(cell.product) {
            productNameLabel.text = dict[cell.product]
        } else {
            productNameLabel.text = "Not yet defined"
        }
        availableQuantityLabel.text! += String(cell.available_quantity)
        priceLabel.text = cell.price + "$"
    }
}

private extension FarmersListCustomCell {
    
    private func setupView() {
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(farmerNameLabel)
        addSubview(productNameLabel)
        addSubview(availableQuantityLabel)
        addSubview(priceLabel)
        addSubview(addButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 150),
            farmerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            farmerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            //addButton.leadingAnchor.constraint(equalTo: farmerNameLabel.trailingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            productNameLabel.topAnchor.constraint(equalTo: farmerNameLabel.bottomAnchor, constant: 10),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            availableQuantityLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
            //availableQuantityLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10)
            availableQuantityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    @objc private func buttonPressed() {
        
    }
}
