import UIKit

final class TextFieldView: UITextField {
    
//    var placeHolderText: String? {
//        didSet {
//            self.placeholder = placeHolderText
//        }
//    }
//
//    var textFieldWidth: CGFloat = 0 {
//        didSet {
//            widthConstraint?.constant = textFieldWidth
//        }
//    }
//
    private var widthConstraint: NSLayoutConstraint?
    //private var placeHolderText: String
    //private var textFieldWidth: CGFloat
    
    init(frame: CGRect = .zero, placeH: String, width: CGFloat) {
        super.init(frame: frame)
        self.placeholder = placeH
        //self.placeHolderText = placeH
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
       // self.textFieldWidth = width
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
        //placeholder = placeHolderText
        backgroundColor = .white
        layer.cornerRadius = 30
        layer.borderWidth = 1.0
        
        layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        rightViewMode = .always
        leftViewMode = .always
        textColor = .black
        
        tintColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        //widthConstraint = widthAnchor.constraint(equalToConstant: self.textFieldWidth)
        //widthConstraint?.isActive = true
    }
    
}
