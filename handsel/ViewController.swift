//
//  ViewController.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/9/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("segue time")
        
        let nextVC = segue.destinationViewController as! WebViewController

        
    }

}

