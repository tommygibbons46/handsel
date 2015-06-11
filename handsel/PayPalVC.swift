//
//  PayPalVC.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/10/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

//class PayPalVC: UIViewController, PayPalProfileSharingDelegate,
//{
//    let payPalConfiguration = PayPalConfiguration()
//    var delegate : PayPalProfileSharingDelegate?
//    
////    init()
////    {
////        super.init()
////    }
////    
//    required convenience init(coder aDecoder: NSCoder) {
//        println("gets here")
//        self.init(coder: aDecoder)
//        payPalConfiguration.merchantName = "handsel"
//        payPalConfiguration.merchantPrivacyPolicyURL = NSURL(string: "http://www.clickstarter.io")
//        payPalConfiguration.merchantUserAgreementURL = NSURL(string: "http://www.clickstarter.io")
//        
//        
//    }
//
//    override func viewWillAppear(animated: Bool)
//    {
//        println("we made it here")
//        PayPalMobile.preconnectWithEnvironment(PayPalEnvironmentProduction)
//        obtainConsent()
//    }
//    
//    func obtainConsent()
//    {
//        let scopes = NSSet(set: [kPayPalOAuth2ScopeProfile, kPayPalOAuth2ScopeEmail, kPayPalOAuth2ScopeAddress, kPayPalOAuth2ScopePhone])
//        
//        let psViewController = PayPalProfileSharingViewController(scopeValues: scopes as Set<NSObject>, configuration: payPalConfiguration, delegate: delegate)
//        
//        
//        self.presentViewController(psViewController, animated: true, completion: nil)
//        
//    }
//    
//    func userDidCancelPayPalProfileSharingViewController(profileSharingViewController: PayPalProfileSharingViewController!)
//    {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    
//    func payPalProfileSharingViewController(profileSharingViewController: PayPalProfileSharingViewController!, userDidLogInWithAuthorization profileSharingAuthorization: [NSObject : AnyObject]!) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//
//
//
//}
