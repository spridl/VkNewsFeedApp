//
//  GradientView.swift
//  VkNewsFeedApp_1
//
//  Created by T on 14.07.2021.
//  Copyright © 2021 T. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    private var gradientLayer = CAGradientLayer()
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
       
    }
    private func setupGradientColors() {
        if let startColor = startColor, let endColor = endColor {
               gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
               }
    }
}
