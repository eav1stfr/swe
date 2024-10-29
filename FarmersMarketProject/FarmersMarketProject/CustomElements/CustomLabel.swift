//
//  CustomLabel.swift
//  FarmersMarketProject
//
//  Created by Александр Эм on 18.10.2024.
//

import UIKit

class CustomLabel: UILabel {
    
    init(text: String, color: UIColor, alpha: CGFloat = 1.0, frame: CGRect = .zero, fontSize: CGFloat) {
        super.init(frame: frame)
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .heavy)
        self.text = text
        self.alpha = alpha
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    
    private func setupLabel() {
        //textColor = UIColor(named: "Color")
        numberOfLines = 2
        textAlignment = .center
        //font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
