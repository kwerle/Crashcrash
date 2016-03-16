//
//  ViewController.swift
//  Crashcrash
//
//  Created by Kurt.Werle on 3/16/16.
//  Copyright © 2016 Kurt.Werle. All rights reserved.
//

import UIKit

import Crashlytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test() {
        let url = NSBundle.mainBundle().URLForResource("file", withExtension: "json")!
        let data = NSData(contentsOfURL: url)
        if let string = data?.toString() {
            print(string) // Will not crash
            NSLog("Log: \(string)") // Will crash on iphone 5c
            CLSNSLogv(string, getVaList([])) // Will crash on iphone 5c
        }
    }

}

extension NSData {
    // convenience to return string contents of NSData.  Default encoding is NSUTF8StringEncoding
    func toString(encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        return String(data: self, encoding: encoding)
    }
}