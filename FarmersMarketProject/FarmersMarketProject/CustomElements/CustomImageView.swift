//
//  CustomImageView.swift
//  FarmersMarketProject
//
//  Created by Александр Эм on 18.10.2024.
//

import UIKit

class CustomImageView: UIImageView {
    init(image: UIImage, alpha: CGFloat, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.image = image
        self.alpha = alpha
        setupImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImage()
    }
    
    private func setupImage() {
        image = self.image
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
    }
}
