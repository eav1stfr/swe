//
//  CustomLabel.swift
//  FarmersMarketProject
//
//  Created by Александр Эм on 18.10.2024.
//

import UIKit

class CustomLabel: UILabel {
    
    init(text: String, alpha: CGFloat, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.text = text
        self.alpha = alpha
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    
    private func setupLabel() {
        textColor = UIColor(named: "Color")
        numberOfLines = 2
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
