//
//  NewsFeedCellLayoutCalculator.swift
//  VkNewsFeedApp_1
//
//  Created by T on 11.04.2021.
//  Copyright © 2021 T. All rights reserved.
//

import UIKit


struct Sizes: FeedCellSizes {
       var moreTextButtonFrame: CGRect
       var bootomView: CGRect
       var totalHeight: CGFloat
       var postLabelFrame: CGRect
       var attachmentFrame: CGRect
   }

protocol FeedCellLayoutCalculatorProtocol {
     func sizes(postText: String?, photoAttachments: [FeedCellPhotoAttachmentViewModel],  isFullSizedPost: Bool) -> FeedCellSizes
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, photoAttachments: [FeedCellPhotoAttachmentViewModel], isFullSizedPost: Bool) -> FeedCellSizes {
        var showMoreTextButton = false
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        // MARK:  Работа с postLabelFrame
        
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postsLabelInsets.left, y: Constants.postsLabelInsets.top), size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postsLabelInsets.left - Constants.postsLabelInsets.right
            var height = text.height(width: width, font: Constants.postLabelFont)
            
            let limitHeght = Constants.postLabelFont.lineHeight * Constants.minifiedPostLimitLines
            
            if !isFullSizedPost && height > limitHeght {
                height = Constants.postLabelFont.lineHeight * Constants.minifiedPostLines
                showMoreTextButton = true
            }
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: работа с moreTextButtonFrame
        
        var moreTextButtonSize = CGSize.zero
        
        if showMoreTextButton {
            moreTextButtonSize = Constants.moreTextButtonSize
        }
        
        let moreTextButtonOrigin = CGPoint(x: Constants.moreTextButtonInsets.left, y: postLabelFrame.maxY)
        let moreTextButtonFrame = CGRect(origin: moreTextButtonOrigin, size: moreTextButtonSize)
        
        // MARK: работа с attachmentFrame
        
        let attacmentTop = postLabelFrame.size == CGSize.zero ? Constants.postsLabelInsets.top : moreTextButtonFrame.maxY + Constants.postsLabelInsets.bottom
        
        var attachmentFrame = CGRect(origin: CGPoint(x: 0, y: attacmentTop),
                                     size: CGSize.zero)
//        if let attachment = photoAttachment {
//            let photoHeight: Float = Float(attachment.height)
//            let photoWidth: Float = Float(attachment.width)
//            let ratio = CGFloat(photoHeight / photoWidth)
//            attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)
//        }
        if let attachment = photoAttachments.first {
              let photoHeight: Float = Float(attachment.height)
              let photoWidth: Float = Float(attachment.width)
              let ratio = CGFloat(photoHeight / photoWidth)
            if photoAttachments.count == 1 {
                attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)
            } else if photoAttachments.count > 1 {
//                attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)
                var photos = [CGSize]()
                for photo in photoAttachments {
                    let photoSize = CGSize(width: CGFloat(photo.width), height: CGFloat(photo.height))
                    photos.append(photoSize)
                }
                
                let rowHeight = RowLayout.rowHeightCounter(superViewWidth: cardViewWidth, photosArray: photos)
                attachmentFrame.size = CGSize(width: cardViewWidth, height: rowHeight!)
            }
        }
        
        // MARK: работа с bottomView
        let bottomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        
        let bottomView = CGRect(origin: CGPoint(x: 0, y: bottomViewTop),
                                size: CGSize(width: cardViewWidth, height: Constants.bottomViewHeight))
        // MARK: работа с totalHeight
        
        let totalHeight = bottomView.maxY + Constants.cardInsets.bottom
        
        return Sizes(moreTextButtonFrame: moreTextButtonFrame,
                     bootomView: bottomView,
                     totalHeight: totalHeight,
                     postLabelFrame: postLabelFrame,
                     attachmentFrame: attachmentFrame)
       }
    
   
}
