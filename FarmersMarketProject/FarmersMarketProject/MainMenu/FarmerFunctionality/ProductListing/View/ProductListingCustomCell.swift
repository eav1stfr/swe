import UIKit

final class ProductListingTableCustomCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let productName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: "Color")!
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
}

extension ProductListingTableCustomCell {
    func set(cellModel: TableProductListingCellModel) {
        switch cellModel.product {
        case 1:
            productName.text = "Banana"
        case 2:
            productName.text = "Banana"
        case 3:
            productName.text = "Apple"
        case 4:
            productName.text = "Orange"
        case 5:
            productName.text = "Grape"
        case 6:
            productName.text = "Mango"
        case 7:
            productName.text = "Carrot"
        case 8:
            productName.text = "Potato"
        case 9:
            productName.text = "Onion"
        case 10:
            productName.text = "Cucumber"
        case 11:
            productName.text = "Pepper"
        default:
            productName.text = "Minion"
        }
        priceLabel.text = "Price: " + cellModel.price + "$"
        quantityLabel.text = "Quantity: " + String(cellModel.available_quantity)
    }
}

private extension ProductListingTableCustomCell {
    private func setupView() {
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(productName)
        addSubview(priceLabel)
        addSubview(quantityLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 100),
            productName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            priceLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 20),
            
            quantityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            quantityLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 20),
        ])
    }
}
