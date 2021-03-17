//
//  AddVC.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-17.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    @IBOutlet weak var pointName: UITextField!
    @IBOutlet weak var pointAddress: UITextField!
    @IBOutlet weak var pointTask: UITextField!
    @IBOutlet weak var pointTags: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clearTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if(self.pointName.text == "" || self.pointAddress.text == "" || self.pointTask.text == "" || self.pointTags.text == ""){
            let alert = UIAlertController(title: "Alert", message: "Please make sure all fields are completed", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        let point = Point.init(name: self.pointName.text!, address: self.pointAddress.text!, task: self.pointTask.text!, tags: self.pointTags.text!,rating: 0);
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PointAdded"), object: nil, userInfo: ["point":point]);
    }
    
}
