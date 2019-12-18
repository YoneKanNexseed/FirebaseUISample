//
//  ViewController.swift
//  FirebaseUISample
//
//  Created by yonekan on 2019/12/18.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class ViewController: UIViewController {

    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()!}}
    // 認証に使用するプロバイダの選択
    let providers: [FUIAuthProvider] = [
        FUIGoogleAuth(),
//        FUIFacebookAuth(),
//        FUITwitterAuth(),
        FUIEmailAuth(),
        FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.authUI.delegate = self
        self.authUI.providers = providers
    }

    @IBAction func button(_ sender: UIButton) {
        let authViewController = self.authUI.authViewController()
        // FirebaseUIのViewの表示
        self.present(authViewController, animated: true, completion: nil)
    }
    
}

extension ViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        // 認証に成功した場合
        if error == nil {
//            self.performSegue(withIdentifier: "toTopView", sender: self)
            print("成功！！！！！！！１")
        }
    }
    
}
