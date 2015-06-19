//
//  AgreementViewController.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/16/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class AgreementViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var buyOrBorrow: UISegmentedControl!
    @IBOutlet weak var sellOrLend: UISegmentedControl!
    @IBOutlet weak var iWillBe: UILabel!
    @IBOutlet weak var setRelease: UILabel!
    @IBOutlet weak var costOrDeposit: UILabel!
    @IBOutlet weak var costOrDepositTextField: UITextField!
    @IBOutlet weak var switchButton: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.timePicker.hidden = true
        self.iWillBe.hidden = true
        self.buyOrBorrow.hidden = true
        self.sellOrLend.hidden = true
        self.costOrDeposit.hidden = true
        self.costOrDepositTextField.hidden = true
        self.setRelease.hidden = true
        self.switchButton.hidden = true
        
        self.timePicker.minimumDate = NSDate()

//        self.costOrDepositTextField
    }

    @IBOutlet weak var timePicker: UIDatePicker!
    

    @IBAction func switchSwitch(sender: AnyObject)
    {
        if self.timePicker.hidden == true
        {
            self.timePicker.hidden = false
        }
        else
        {
            self.timePicker.hidden = true
        }
    }
    

    func dismissKeyboard()
    {
        self.costOrDepositTextField.resignFirstResponder()
        self.switchButton.hidden = false
        self.setRelease.hidden = false
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        var otherString = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        var arrayStrings = otherString.componentsSeparatedByString(".")
        if arrayStrings.count > 2
        {
            return false
        }
        if arrayStrings.count > 1
        {
            if count(arrayStrings[1]) > 2
            {
                return false
            }
        }
       
//        if count(textField.text) > 0
//        {
//            let formatter = NSNumberFormatter()
//            formatter.numberStyle = .CurrencyStyle
//            var numberText: NSNumber = textField.text.toInt()!
//            println(formatter.stringFromNumber(numberText))
//        }
//       
        if count(textField.text) > 1
        {
        }
        else
        {
            textField.text = "$"
        }
        
//        var specialString = self.costOrDepositTextField.text.componentsSeparatedByString(".")
//        if count(specialString) > 1
//        {
//            if count(specialString[1]) > 1
//            {
//                println("should disallow typing")
//                return false
//            }
//        }
//        if count(specialString[0]) == 4
//        {
//            println("we need to add a comma")
//            let commaString = ","
//            var ours = specialString[0]
//            ours.insert(",", atIndex: ours.startIndex.successor().successor())
//            println(ours)
//            self.costOrDepositTextField.text = ours
//        }
//        if count(specialString[0]) == 6
//        {
//            println("we need to add a comma")
//            var ours = specialString[0]
//            ours.removeAtIndex(ours.startIndex.successor().successor())
//            println("we got here")
//            ours.insert(",", atIndex: ours.startIndex.successor().successor().successor())
//            self.costOrDepositTextField.text = ours
//        }
        
        
        return true

    }
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        self.costOrDepositTextField.text = "$"
        let tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)
    }
    
    
    @IBAction func agreementTap(sender: AnyObject)
    {
        let string = "tim"
        let alert = UIAlertController(title: "Send Agreement to " + string , message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        alert.addAction(UIAlertAction(title: "View Terms", style: .Default, handler:
            {
                (action1) -> Void in
                
                let termsAlert = UIAlertController(title: "Agreement Terms", message: self.termsAgreement, preferredStyle: UIAlertControllerStyle.Alert)
                
                termsAlert.addAction(UIAlertAction(title: "Agree and Send", style: UIAlertActionStyle.Cancel, handler: { (removeVC) -> Void in
                    self.performSegueWithIdentifier("payments", sender: nil)
                }))
                termsAlert.addAction(UIAlertAction(title: "I Do Not Agree", style: UIAlertActionStyle.Default, handler: { (removeVC) -> Void in
                    self.dismissViewControllerAnimated(true, completion: { () -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                    })
                }))
                self.presentViewController(termsAlert, animated: true, completion: nil)
                
                
            }))
        alert.addAction(UIAlertAction(title: "I agree to these terms", style: .Cancel, handler:
            { (action2) -> Void in
            self.performSegueWithIdentifier("payments", sender: nil)
            }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler:
            {
                (action1) -> Void in
            }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func buyerOrSellerTap(sender: AnyObject)
    {
        if sender.selectedSegmentIndex == 0
        {
            self.buyOrBorrow.hidden = false
            self.sellOrLend.hidden = true
            self.iWillBe.hidden = false
        }
        else
        {
            self.sellOrLend.hidden = false
            self.buyOrBorrow.hidden = true
            self.iWillBe.hidden = false
        }
    }
    
    @IBAction func buyingOrBorrowing(sender: AnyObject)
    {
        if sender.selectedSegmentIndex == 0
        {
            self.costOrDeposit.text = "The cost is"
            self.costOrDeposit.hidden = false
            self.costOrDepositTextField.hidden = false
            self.timePicker.datePickerMode = UIDatePickerMode.DateAndTime
            self.timePicker.minuteInterval = 30
        }
        else
        {
            self.costOrDeposit.text = "The security deposit is"
            self.costOrDeposit.hidden = false
            self.costOrDepositTextField.hidden = false
            self.timePicker.datePickerMode = UIDatePickerMode.Date
        }
    }
    
    @IBAction func sellingOrLendingTap(sender: AnyObject)
    {
        if sender.selectedSegmentIndex == 0
        {
            self.costOrDeposit.text = "The cost is"
            self.costOrDeposit.hidden = false
            self.costOrDepositTextField.hidden = false
            self.timePicker.datePickerMode = UIDatePickerMode.DateAndTime
            self.timePicker.minuteInterval = 30
        }
        else
        {
            self.costOrDeposit.text = "The security deposit is"
            self.costOrDeposit.hidden = false
            self.costOrDepositTextField.hidden = false
            self.timePicker.datePickerMode = UIDatePickerMode.Date

        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let brainTreeVC = segue.destinationViewController as! BrainTreeVC
        brainTreeVC.transactionAmount = self.costOrDepositTextField.text
    }
    let termsAgreement = "We agree that any claim or dispute between us shall be resolved by binding arbitration administered by Hansel under the Hansel Code of Procedure for Resolving Disputes in effect when the claim is filed. Any award by the arbitrator(s) may be entered as a judgment in any court having jurisdiction.  Documents electronically stored and/or produced (E-discovery) may be delivered in any reasonable form as determined by the Arbitrator(s). The Arbitrator(s) have full authority to determine the scope of the E-discovery search and production.  The Award shall be a reasoned Award stating the reasoning of the Arbitrator(s). The Arbitration will be concluded within 3 days calculated from the initiation of the Claim until the delivery of the Award."
}
