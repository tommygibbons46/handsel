//
//  PayPalPaymentVC.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/10/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

//class PayPalPaymentVC: UIViewController, PayPalPaymentDelegate {
//
//    
//    var config = PayPalConfiguration()
//    var dele : PayPalPaymentDelegate?
//    
//    required init(coder aDecoder: NSCoder)
//    {
//        super.init(coder: aDecoder)
//    }
//    
//    
//    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        config.payPalShippingAddressOption = PayPalShippingAddressOption.PayPal
//
//    }
//    
//    override func viewWillAppear(animated: Bool)
//    {
//        PayPalMobile.preconnectWithEnvironment(PayPalEnvironmentProduction)
//        showMeTheMoney()
//    }
//    
//    func showMeTheMoney()
//    {
//        var payment = PayPalPayment()
//        payment.amount = NSDecimalNumber(string: ".50")
//        payment.currencyCode = "USD"
//        payment.shortDescription = "here goes something"
//        payment.intent = PayPalPaymentIntent.Sale
//        
//        self.dele = self
//        
//        let paymentVC = PayPalPaymentViewController(payment: payment, configuration: config, delegate: dele)
//        
//        presentViewController(paymentVC, animated: true, completion: nil)
//        
//    }
//    
//    //pragma Mark delegate methods
//    
//    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController!, didCompletePayment completedPayment: PayPalPayment!)
//    {
//        
//        println("here is the description \(completedPayment.description)")
//        println("here is the confirmation \(completedPayment.confirmation)")
//        
//        self.dismissViewControllerAnimated(true, completion: nil)
//    
//    }
//    
//    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController!)
//    {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }

    

//}
