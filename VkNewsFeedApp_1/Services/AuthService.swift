//
//  AuthService.swift
//  VkNewsFeedApp_1
//
//  Created by T on 08/02/2021.
//  Copyright © 2021 T. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
   private let appId = "7531902"
    private let vkSdk: VKSdk
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    var userId: String? {
        return VKSdk.accessToken()?.userId
    }
    
    func wakeUpSession() {
        let scope = ["wall", "friends"]
        VKSdk.wakeUpSession(scope) { [weak self] (state, error) in
            switch state {
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            case .authorized:
                print("authorized")
                self?.delegate?.authServiceSignIn()
            default:
                self?.delegate?.authServiceSignInDidFail()
            }
        }
    }
        func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
            if result.token != nil {
                delegate?.authServiceSignIn()
            }
            
       }
       
       func vkSdkUserAuthorizationFailed() {
           print(#function)
        delegate?.authServiceSignInDidFail()
       }
       
       func vkSdkShouldPresent(_ controller: UIViewController!) {
           print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
       }
       
       func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
           print(#function)
       }
}
