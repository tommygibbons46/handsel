//
//  ViewController.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/9/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let instance = Venmo.sharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//        let profPermission = VENPermissionAccessProfile
//        let paymentPermission = VENPermissionMakePayments
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
 
//        Venmo.sharedInstance().requestPermissions([VENPermissionAccessProfile], withCompletionHandler: { (success, error) -> Void in
//            if success
//            {
//                println("we have a success")
//            }
//            else
//            {
//                println("no success")
//            }
//        })

        
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
//        Venmo.sharedInstance().sendPaymentTo("Sean.emmer@gmail.com", amount: 1, note: "what up mang") { (transaction, success, error) -> Void in
//            if success
//            {
//                println("we have a success")
//                println("here is our \(transaction)")
//               
//            }
//        }
//        instance.sendPaymentTo("9739439239", amount: 0 , note: "testeroo", audience: , completionHandler: { (transaction, success, error) -> Void in
//        if success
//        {
//            println("we have a success")
//            println(transaction)
//            
//        }
//        })
    }
    
    @IBAction func inquireAboutBalance(sender: AnyObject)
    {
//        Venmo.sharedInstance().
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("segue time")
        
        let nextVC = segue.destinationViewController as! WebViewController

        
    }

}

