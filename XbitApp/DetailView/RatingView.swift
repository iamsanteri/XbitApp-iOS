//
//  RatingView.swift
//  XbitApp
//
//  Created by Erik Kellenter on 24.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

@IBDesignable class RatingView: UIStackView {
    
    var imageViews = [UIImageView]()
    
    @IBInspectable var rating: Int = 0 {
        didSet {
            setupImageViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupImageViews()
    }
    
    //MARK: - Private Methods
    
    private func setupImageViews() {
        
        for imageView in imageViews {
            removeArrangedSubview(imageView)
            imageView.removeFromSuperview()
        }
        imageViews.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let emptyStarImage = UIImage(named: "empty_star", in: bundle, compatibleWith: self.traitCollection)
        let filledStarImage = UIImage(named: "filled_star", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<rating {
            let imageView = UIImageView()
            imageView.image = filledStarImage
            setupImageViewSettings(imageView: imageView)
            
            addArrangedSubview(imageView)
            imageViews.append(imageView)
        }
        
        for _ in rating..<5 {
            let imageView = UIImageView()
            imageView.image = emptyStarImage
            setupImageViewSettings(imageView: imageView)
            
            addArrangedSubview(imageView)
            imageViews.append(imageView)
        }
    }
    
    private func setupImageViewSettings(imageView: UIImageView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
    }
}
