//
//  GalleryCollectionViewCell.swift
//  VkNewsFeedApp_1
//
//  Created by T on 13.05.2021.
//  Copyright © 2021 T. All rights reserved.
//

import Foundation
import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let myImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8980392157, blue: 0.9098039216, alpha: 1)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myImageView)
        
        // myImageView constraints
        myImageView.fillSuperview()
        
    }
    
    override func prepareForReuse() {
               myImageView.image = nil
           }
           
    func set(imageUrl: String?) {
        myImageView.set(imageUrl: imageUrl)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 10
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 2.5, height: 4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
