//
//  ViewController.swift
//  QuickSms
//
//  Created by f9d53410cd6e99a9ec8cc76f844eb50b8cb0e1c8 on 03/07/2018.
//  Copyright (c) 2018 f9d53410cd6e99a9ec8cc76f844eb50b8cb0e1c8. All rights reserved.
//

import UIKit
import QuickSms

class ViewController: UIViewController {
    
    var quickSms: QuickSms? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quickSms = QuickSms.configure(withUsername: "test@yopmail.com", password: "1234")
        sendSms()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendSms() {
        var sms = Sms()
        sms.sender = "Test"
        sms.message = "Hello"
        sms.recipient = "00000000000"
        sms.supportDnd = false
        
        quickSms?.sendSms(sms: sms).addOnCompleteListener(handler: { (res, err) in
            if res != nil {
                print(res!.totalNumberOfSmsCreditsUsed)
                print(res!.messageId)
            }
            if err != nil {
                print(err!.message)
            }
        })
    }

    func getAccountBalance() {
        quickSms?.getAccountBalance().addOnCompleteListener(handler: { (res, err) in
            if res != nil {
                print(res!.balance)
            }
            if err != nil {
                print(err!.message)
            }
        })
    }
    
    func getDeliveryReport() {
        quickSms?.getDeliveryReport(messageId: "54765").addOnCompleteListener(handler: { (res, err) in
            if res != nil {
                print(res!.status)
            }
            if err != nil {
                print(err!.message)
            }
        })
    }
}

