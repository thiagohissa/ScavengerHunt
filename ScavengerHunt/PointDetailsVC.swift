//
//  PointDetailsVC.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-17.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class PointDetailsVC: UIViewController {

    @IBOutlet weak var pointName: UILabel!
    @IBOutlet weak var pointAddress: UILabel!
    @IBOutlet weak var pointTask: UILabel!
    @IBOutlet weak var pointTags: UILabel!
    var point: Point!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pointName.text = point.name;
        self.pointAddress.text = point.address;
        self.pointTask.text = point.task;
        self.pointTags.text = point.tags;
    }
    
    

}
