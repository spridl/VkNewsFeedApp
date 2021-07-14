//
//  String + Height.swift
//  VkNewsFeedApp_1
//
//  Created by T on 26.04.2021.
//  Copyright © 2021 T. All rights reserved.
//

import Foundation
import UIKit
extension String {
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        return ceil(size.height)
    }
}
