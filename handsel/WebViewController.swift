
//
//  WebViewController.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/9/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        println("here")
        let url = NSURL(string: "https://api.venmo.com/v1/oauth/authorize?client_id=2676&scope=make_payments%20access_profile")
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)

    }

    //https://api.venmo.com/v1/me?access_token=777510c888010bcb8ed319da42d4df13086d4c476a0d58e2c6558694089229cb
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    



}
