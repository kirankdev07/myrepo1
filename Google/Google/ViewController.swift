//
//  ViewController.swift
//  Google
//
//  Created by Kirankumar Bollem on 12/24/18.
//  Copyright © 2018 Kirankumar Bollem. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let signInButton = GIDSignInButton(frame: CGRect (x: 0, y: 0, width: 100, height: 50))
        signInButton.center = view.center
        view.addSubview(signInButton)
    }
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        print(user.profile.email)
    }
}

