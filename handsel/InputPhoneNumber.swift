//
//  InputPhoneNumber.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/16/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit
import AddressBookUI


class InputPhoneNumber: UIViewController, ABPeoplePickerNavigationControllerDelegate {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showContacts(sender: AnyObject)
    {
        let picker = ABPeoplePickerNavigationController()
        picker.peoplePickerDelegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }

    
    func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController!, didSelectPerson person: ABRecord!)
    {
        let firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty).takeRetainedValue() as! String
        let lastName = ABRecordCopyValue(person, kABPersonLastNameProperty).takeRetainedValue() as! String
        let phoneNumbers: ABMultiValueRef = ABRecordCopyValue(person, kABPersonPhoneProperty).takeRetainedValue()
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
    
    @IBAction func enterPhoneNumber(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Counterparty Phonenumber", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler
            {
                (textField) -> Void in
                textField.placeholder = "Phonenumber"
                textField.textAlignment = NSTextAlignment.Center
                textField.keyboardType = UIKeyboardType.NumberPad
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
