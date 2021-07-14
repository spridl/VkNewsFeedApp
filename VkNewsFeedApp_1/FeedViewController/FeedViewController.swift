//
//  FeedViewController.swift
//  VkNewsFeedApp_1
//
//  Created by T on 08/02/2021.
//  Copyright © 2021 T. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemBlue
        fetcher.getFeed(nextBatchFrom: nil) { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map { (feedItem) in
                print(feedItem.date)
            }
        }
    }
}
