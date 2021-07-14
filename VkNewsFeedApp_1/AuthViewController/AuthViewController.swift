//
//  ViewController.swift
//  VkNewsFeedApp_1
//
//  Created by T on 08/02/2021.
//  Copyright © 2021 T. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    @IBOutlet var signInButton: UIButton!
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        authService = SceneDelegate.shared().authService
        signInButton.layer.cornerRadius = 10
    }

    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

