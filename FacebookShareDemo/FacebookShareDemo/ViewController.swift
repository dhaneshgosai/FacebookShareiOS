//
//  ViewController.swift
//  FacebookShareDemo
//
//  Created by Dhanesh Gosai on 10/05/20.
//  Copyright © 2020 Dhanesh Gosai. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let loginButton = FBLoginButton()
//        loginButton.center = view.center
//        loginButton.permissions = ["public_profile", "email"]
//        view.addSubview(loginButton)
    }
    
    @IBAction func  btnFBShareClick (_ sender: AnyObject) {
        faceBookShare()
    }
        
    func faceBookShare()
    {
        
        let content = ShareLinkContent()
        content.contentURL = URL(string: "https://developers.facebook.com")!
//        FBSDKShareDialog.show(from: self, with: content, delegate: self)
        
//        let content:ShareLinkContent = ShareLinkContent.init(url: URL.init(string: "https://developers.facebook.com") ?? URL.init(fileURLWithPath: "https://developers.facebook.com"), quote: "Share This Content")
        let sharedialog = ShareDialog.init(fromViewController: self, content: content, delegate: self)
        sharedialog.show()
    }

}

extension ViewController : SharingDelegate {
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
        print(results)
    }
    
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        print(error)
    }
    
    func sharerDidCancel(_ sharer: Sharing) {
        print("Share Canceled")
    }
    
}
