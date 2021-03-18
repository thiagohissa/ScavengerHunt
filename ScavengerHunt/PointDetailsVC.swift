//
//  PointDetailsVC.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-17.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit
import Cosmos

class PointDetailsVC: UIViewController {
    @IBOutlet weak var pointName: UITextField!
    @IBOutlet weak var pointAddress: UITextField!
    @IBOutlet weak var pointTask: UITextField!
    @IBOutlet weak var pointTags: UITextField!
    @IBOutlet weak var pointRating: CosmosView!
    var point: Point!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pointName.text = point.name;
        self.pointAddress.text = point.address;
        self.pointTask.text = point.task;
        self.pointTags.text = point.tags;
        self.pointRating.rating = point.rating;
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        // TODO: change rating from 0 to rate
        let newData = Point.init(name: self.pointName.text ?? "", address: self.pointAddress.text ?? "", task: self.pointTask.text ?? "", tags: self.pointTags.text ?? "", rating: self.pointRating.rating)
        let saved = PointsManager.editPoint(name: point.name, newData: newData)
        if(!saved){
            let alert = UIAlertController(title: "Alert", message: "Something went wrong when saving edits", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Saved!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PointEdited"), object: nil, userInfo: nil);
    }
    
    @IBAction func locationTapped(_ sender: UIButton) {
    }
    
    @IBAction func shareTapped(_ sender: UIButton) {
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        PointsManager.deletePoint(name: point.name)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PointDeleted"), object: nil, userInfo: nil);
        self.dismiss(animated: true, completion: nil)
    }
    

}
