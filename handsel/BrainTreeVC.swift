//
//  BrainTreeVC.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/11/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class BrainTreeVC: UIViewController, BTDropInViewControllerDelegate {
    
    var brainTree: Braintree?
    var dele: BTDropInViewControllerDelegate?
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        brainTree = Braintree(clientToken: "MIIBCgKCAQEAzXvyJaE3GlkhlMT6mIp4ohqvkgxwD3yySzda8jw0+2y58bjjZfoy6hYTQ6VBSOEXjBrtzULVmV1FGyi4Pnt3eb+s/xoyKoV/HREn/vwh1ThbIg0uC3WOeoYnOaB9p5UO2PLa5DVqVx10BFSoFY5rZUMeTXO7r4Hqsk4bU5/4KdDv94t3ppRuwcZJksHxCElyskmmyPRuaUbDQUv8pxjyJ+KRV+USGFCENqkcAaT4C2JB1Blwdc4r860m2o/ef+bwNCTpmOKyM40zawnwxxSfWN5oONSEENQCucZwaN8beP6qQJ0HRoNJzMhjEtfwvZo3ixfr8qrWkLf2ogAeAbuFoQIDAQAB")
        

        // Do any additional setup after loading the view.
    }
    
//    func override viewDidAppear(animated: Bool)
//    {
//        startBrainTree()
//    }

    func startBrainTree()
    {
        var dropInVC = BTDropInViewController()
        dropInVC.delegate = self
        println("started from the bottom")
        
        dropInVC.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "userDidCancelPayment:")
        println("started from the bottom")
        println(dropInVC)
        let navController = UINavigationController(rootViewController: dropInVC)
        self.presentViewController(dropInVC, animated: true, completion: nil)
    }
    
    @IBAction func buttonTap(sender: AnyObject)
    {
        startBrainTree()

    }
    func userDidCancelPayment()
    {
        println("cancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dropInViewController(viewController: BTDropInViewController!, didSucceedWithPaymentMethod paymentMethod: BTPaymentMethod!)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dropInViewControllerDidCancel(viewController: BTDropInViewController!)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
