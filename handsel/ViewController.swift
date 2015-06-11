//
//  ViewController.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/9/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate, PayPalPaymentDelegate, PayPalFuturePaymentDelegate {
    
    @IBOutlet weak var amountField: UITextField!

    @IBOutlet weak var recipientField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    
    
    func setUpApplePay()
    {
        let request = Stripe.paymentRequestWithMerchantIdentifier("merchant.handsel")
        let label = "test dummy"
        let amount = NSDecimalNumber(string: "1.00")
        request?.paymentSummaryItems = [PKPaymentSummaryItem(label: label, amount: amount)]
        if Stripe.canSubmitPaymentRequest(request)
        {
            var paymentVC : STPTestPaymentAuthorizationViewController?

            paymentVC = STPTestPaymentAuthorizationViewController(paymentRequest: request)
            
            paymentVC?.delegate = self
            
            presentViewController(paymentVC!, animated: true, completion: nil)
            
//            paymentVC = PKPaymentAuthorizationViewController(paymentRequest: request)
            


        }
        
    }
    
    func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController!, didAuthorizePayment payment: PKPayment!, completion: ((PKPaymentAuthorizationStatus) -> Void)!)
    {
        STPAPIClient.sharedClient().createTokenWithPayment(payment, completion: { (token, error) -> Void in
            if error == nil
            {
                completion(PKPaymentAuthorizationStatus.Success)
                println("paid the bitch")
            }
            else
            {
                completion(PKPaymentAuthorizationStatus.Failure)
            }
        })

    }
    
    func paymentAuthorizationViewControllerDidFinish(controller: PKPaymentAuthorizationViewController!)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func setUpApplePayStubs()
    {
        let requestTwo = Stripe.paymentRequestWithMerchantIdentifier("merchant.handsel")
        let label = "test mummy"
        let amount = NSDecimalNumber(string: "1.00")
        
        
    }

    @IBAction func giveVenmoAuthTap(sender: AnyObject)
    {
        if !Venmo.isVenmoAppInstalled()
        {
            Venmo.sharedInstance().defaultTransactionMethod = VENTransactionMethod.API
            println("no app installed")
        }
        else
        {
            Venmo.sharedInstance().defaultTransactionMethod = VENTransactionMethod.AppSwitch
            println("we have the app")
        }
        Venmo.sharedInstance().requestPermissions(["access_friends", "access_email", "make_payments", "access_balance"], withCompletionHandler: { (success, error) -> Void in
            if success
            {
                println("we have a success")
            }
            else
            {
                 println("no success")
            }
        })
        
    


        
    }
    
    
    @IBAction func paymentTap(sender: AnyObject)
    {
//        let payAmount : Float = .5 as Float
        var amount = (amountField.text as NSString).floatValue
        
        Venmo.sharedInstance().sendRequestTo(recipientField.text, amount: 1, note: "coming back atcha") { (transaction, success, error) -> Void in
            if success
            {
                println("we have a success")
                println("here is our \(transaction)")
            }
        }

    }
    
    @IBAction func inquireAboutBalance(sender: AnyObject)
    {
        setUpApplePay()
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        println("segue time")
//        
//        let nextVC = segue.destinationViewController as! WebViewController
//
//        
//    }
    
    
    
    ///paypal
    @IBOutlet weak var successView: UIView!
    var config = PayPalConfiguration()
    var resultText = ""
    var environment:String = PayPalEnvironmentProduction
        {
        willSet(newEnvironment)
        {
            if (newEnvironment != environment)
            {
                PayPalMobile.preconnectWithEnvironment(newEnvironment)
            }
        }
    }
    func preparePayPal()
    {
        config.merchantName = "Tommy's Test Pod"
        config.acceptCreditCards = true
        config.merchantPrivacyPolicyURL = NSURL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        config.merchantUserAgreementURL = NSURL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
    }
    
    @IBAction func payPalPay(sender: AnyObject)
    {
//        preparePayPal()
//        let total = NSDecimalNumber(string: "1")
//        let payment = PayPalPayment()
//        payment.amount = total;
//        payment.currencyCode = "USD"
//        payment.shortDescription = "Handsel Test Payment"
//        
//        if(!payment.processable)
//        {
//            println("Payment cannot go through")
//        }
//        else
//        {
//            println("Payment is on its way")
//            let payPalPayVC = PayPalPaymentViewController(payment: payment, configuration: config, delegate: self)
//            presentViewController(payPalPayVC, animated: true, completion: nil)
//            
//        }
    }
    
    
    //pragmaMark PayPalPayment Delegates
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController!)
    {
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController!, didCompletePayment completedPayment: PayPalPayment!)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        println("\(completedPayment!.description)")
        println("\(completedPayment.confirmation)")
    }
    
    //pragmaMark PayPalFuturePayment Delegates
    
    @IBAction func authorizeFuturePaymentsAction(sender: AnyObject)
    {
        let futurePaymentViewController = PayPalFuturePaymentViewController(configuration: config, delegate: self)
        presentViewController(futurePaymentViewController, animated: true, completion: nil)
    }
    func payPalFuturePaymentDidCancel(futurePaymentViewController: PayPalFuturePaymentViewController!)
    {
        println("PayPal Future Payment Authorizaiton Canceled")
        successView.hidden = true
        futurePaymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalFuturePaymentViewController(futurePaymentViewController: PayPalFuturePaymentViewController!, didAuthorizeFuturePayment futurePaymentAuthorization: [NSObject : AnyObject]!)
    {
        println("PayPal Future Payment Authorization Success!")
        // send authorizaiton to your server to get refresh token.
        futurePaymentViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in
            println("\(futurePaymentAuthorization!.description)")
        })
    }
    
    class someViewController: UIViewController, PayPalProfileSharingDelegate
    {
        let payPalConfiguration = PayPalConfiguration()
        var delegate : PayPalProfileSharingDelegate?
        
        init()
        {
            super.init(nibName: nil, bundle: nil)
        }
        
        required convenience init(coder aDecoder: NSCoder) {
            self.init(coder: aDecoder)
//            super.init(coder: aDecoder)
            
            payPalConfiguration.merchantName = "handsel"
            payPalConfiguration.merchantPrivacyPolicyURL = NSURL(string: "http://www.clickstarter.io")
            payPalConfiguration.merchantUserAgreementURL = NSURL(string: "http://www.clickstarter.io")
            
            
        }
        
        override func viewWillAppear(animated: Bool)
        {
            println("we made it here")
            PayPalMobile.preconnectWithEnvironment(PayPalEnvironmentProduction)
        }
        
        
        func obtainConsent()
        {
            let scopes = NSSet(set: [kPayPalOAuth2ScopeProfile, kPayPalOAuth2ScopeEmail, kPayPalOAuth2ScopeAddress, kPayPalOAuth2ScopePhone])
            
            let psViewController = PayPalProfileSharingViewController(scopeValues: scopes as Set<NSObject>, configuration: payPalConfiguration, delegate: delegate)
            
            
            self.presentViewController(psViewController, animated: true, completion: nil)
            
        }
        
        //delegate methods
        
        func userDidCancelPayPalProfileSharingViewController(profileSharingViewController: PayPalProfileSharingViewController!)
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        

        func payPalProfileSharingViewController(profileSharingViewController: PayPalProfileSharingViewController!, userDidLogInWithAuthorization profileSharingAuthorization: [NSObject : AnyObject]!) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        

        
    
        
 
        
    }

}

