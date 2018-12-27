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
    func application(application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize sign-in
        var configureError: NSError?
       
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        GIDSignIn.sharedInstance().clientID = "Cliend id From GoogleService-Info.plist file"
        GIDSignIn.sharedInstance().delegate = self as! GIDSignInDelegate
        return true
        GIDSignIn.sharedInstance().clientID = "kirankumarb944@gmail.com"
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        print(user.profile.email)
    }
}

