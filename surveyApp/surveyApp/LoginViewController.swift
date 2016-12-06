//
//  LoginViewController.swift
//  surveyApp
//
//  Created by Emily Su on 12/6/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.current() != nil {
            self.openViewControllerOnIdentifierOnStoryBoard(strIdentifier: "Home", strStoryboard: "Main")
        }
        
        else {
            let loginButton = FBSDKLoginButton()
            self.view.addSubview(loginButton)
            loginButton.delegate = self
            loginButton.center = self.view.center
            
        }
    }
    
//    func isLoggedIn() {
//        let accessToken = FBSDKAccessToken.current().tokenString;
//        return accessToken != nil;
//    }
//    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        self.openViewControllerOnIdentifierOnStoryBoard(strIdentifier: "Home", strStoryboard: "Main")
        print("Successfully logged in with facebook...")
    }
    
    func openViewControllerOnIdentifierOnStoryBoard(strIdentifier: String, strStoryboard: String) {
        let loginStoryboard = UIStoryboard(name: strStoryboard, bundle: nil)
        let controller = loginStoryboard.instantiateViewController(withIdentifier: strIdentifier) as UIViewController
        present(controller, animated: true, completion: nil)
    }
}
