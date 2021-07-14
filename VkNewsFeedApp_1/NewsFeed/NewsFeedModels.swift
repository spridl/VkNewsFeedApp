//
//  NewsFeedModels.swift
//  VkNewsFeedApp_1
//
//  Created by T on 09/02/2021.
//  Copyright (c) 2021 T. All rights reserved.
//

import UIKit

enum NewsFeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsFeed
        case getUser
        case revealPostIds(postId: Int)
        case getNextBatch
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsFeed(feed: FeedResponse, revealedPostIds: [Int])
        case presentUserInfo(user: UserResponse?)
        case presentFooterLoader
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNewsFeed(feedViewModel: FeedViewModel)
        case displayUser(userViewModel: UserViewModel )
        case displayFooterLoader
      }
    }
  }
}
struct UserViewModel: TitleViewViewModel {
       var photoUrlString: String?
       
       
   }

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var photoAttachments: [FeedCellPhotoAttachmentViewModel]
        
        var postId: Int
        
        var sizes: FeedCellSizes
        
        var iconUrlString: String
        
        var name: String
        
        var date: String
        
        var text: String?
        
        var likes: String?
        
        var comments: String?
        
        var shares: String?
        
        var views: String?
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    let cells: [Cell]
    let footerTitle: String?
}
