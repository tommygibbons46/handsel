//
//  ViewController.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/9/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate {
    

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
        Venmo.sharedInstance().sendRequestTo("Sean.emmer@gmail.com", amount: 1, note: "coming back atcha") { (transaction, success, error) -> Void in
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("segue time")
        
        let nextVC = segue.destinationViewController as! WebViewController

        
    }

}

