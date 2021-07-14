//
//  NewsFeedInteractor.swift
//  VkNewsFeedApp_1
//
//  Created by T on 09/02/2021.
//  Copyright (c) 2021 T. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
  func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {

  var presenter: NewsFeedPresentationLogic?
  var service: NewsFeedService?
  func makeRequest(request: NewsFeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsFeedService()
    }
    switch request {
    case .getNewsFeed:
        service?.getFeed(completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
        })
    case .getUser:
        service?.getUser(completion: { [weak self] (user) in
            self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentUserInfo(user: user))
        })
    case .revealPostIds(let postId):
        service?.revealPostIds( forPostId: postId, completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
        })
    case .getNextBatch:
        self.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentFooterLoader)
        service?.getNextBatch(completion: { (revealedPostIds, feed) in
            self.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
        })
    }
  }
}
