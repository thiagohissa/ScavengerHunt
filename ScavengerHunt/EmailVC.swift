//
//  EmailVC.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-18.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit
import MessageUI

class EmailVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var message: UITextView!
    var point: Point!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([self.email.text!])
            mail.setMessageBody("<p>\(self.message.text!)</p> <p>A Point was shared with you:</p><p>\(point.name)</p><p>\(point.address)</p><p>\(point.task)</p><p>\(point.tags)</p><p>\(point.rating)</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            // Device does not support email
            self.alert(message: "Ops! Your device does not support email.")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

    @IBAction func sendTapped(_ sender: UIButton) {
        if(self.email.text != "" && self.email.text?.contains("@") == true){
            self.sendEmail()
        }
        else{
            self.alert(message: "Must be a valid email")
        }
    }
    
    func alert(message: String) -> Void {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
