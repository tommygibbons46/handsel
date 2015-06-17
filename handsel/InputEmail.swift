//
//  InputEmail.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/16/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit
import AddressBookUI

class InputEmail: UIViewController, ABPeoplePickerNavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func showContacts(sender: AnyObject)
    {
        //this would be great if we could access their gmail contacts
        let picker = ABPeoplePickerNavigationController()
        picker.peoplePickerDelegate = self
        self.presentViewController(picker, animated: true, completion: nil)

    }
    
    
    func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController!, didSelectPerson person: ABRecord!)
    {
        let phoneNumbers: ABMultiValueRef = ABRecordCopyValue(person, kABPersonEmailProperty).takeRetainedValue()
        if (ABMultiValueGetCount(phoneNumbers)>0 )
        {
            let index = 0 as CFIndex
            var phoneNumber = ABMultiValueCopyValueAtIndex(phoneNumbers, index).takeRetainedValue() as! String
            println(phoneNumber)
        }
    }
    
    func peoplePickerNavigationControllerDidCancel(peoplePicker: ABPeoplePickerNavigationController!)
    {
        
    }

    
    
    @IBAction func inputEmailAddress(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Counterparty Email", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler
            {
                (textField) -> Void in
                textField.placeholder = "Email"
                textField.textAlignment = NSTextAlignment.Center
                textField.keyboardType = UIKeyboardType.URL
            }
        
        alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler:
            {
                (action1) -> Void in
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler:
            {
                (action1) -> Void in
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    


}
