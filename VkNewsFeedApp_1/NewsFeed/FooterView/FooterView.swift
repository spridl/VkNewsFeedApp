//
//  FooterView.swift
//  VkNewsFeedApp_1
//
//  Created by T on 14.07.2021.
//  Copyright © 2021 T. All rights reserved.
//

import Foundation
import UIKit

class FooterView: UIView {
    
    private var mylabel: UILabel = {
       let myLabel = UILabel()
        myLabel.font = UIFont.systemFont(ofSize: 13)
        myLabel.textColor = #colorLiteral(red: 0.631372549, green: 0.6470588235, blue: 0.662745098, alpha: 1)
        myLabel.textAlignment = .center
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private var loader: UIActivityIndicatorView = {
       let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        return loader
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(loader)
        addSubview(mylabel)
        
        mylabel.anchor(top: topAnchor,
                       leading: leadingAnchor,
                       bottom: nil,
                       trailing: trailingAnchor,
                       padding: UIEdgeInsets(top: 8, left: 20, bottom: 777, right: 20))
        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loader.topAnchor.constraint(equalTo: mylabel.bottomAnchor, constant: 8).isActive = true
        
        
    }
    
    func showLoader() {
        loader.startAnimating()
    }
    func setTitle(_ title: String?) {
        loader.stopAnimating()
        mylabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
