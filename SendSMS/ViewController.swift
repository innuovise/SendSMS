//
//  ViewController.swift
//  SendSMS
//
//  Created by SK on 9/10/17.
//  Copyright © 2017 SK. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Send a message
    func sendMessage()
    {
        let messageVC = MFMessageComposeViewController()
        
        if !MFMessageComposeViewController.canSendText()
        {
            print("SMS services are not available")
        }
        else
        {
            messageVC.body = "김성환님이 모임 장소에 도착 하셨습니다"
            messageVC.recipients = ["01049203906"] // Optionally add some tel numbers
            messageVC.messageComposeDelegate = self
            
            present(messageVC, animated: true, completion: nil)
        }
    }
    
    // Conform to the protocol
    // MARK: - Message Delegate method
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result.rawValue {
        case MessageComposeResult.cancelled.rawValue:
            print("message canceled")
            
        case MessageComposeResult.failed.rawValue:
            print("message failed")
            
        case MessageComposeResult.sent.rawValue:
            print("message sent")
            
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }


    @IBAction func sendSMSMsg(_ sender: Any)
    {
        sendMessage()
    }
}

