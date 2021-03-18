//
//  SearchVC.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-18.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var criteriaSegment: UISegmentedControl!
    @IBOutlet weak var criteria: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var viewButton: UIButton!
    var point: Point?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.result.text = ""
        self.viewButton.isHidden = true
    }
    
    @IBAction func searchTapped(_ sender: UIButton) {
        // Name
        if criteriaSegment.selectedSegmentIndex == 0 {
            self.point = PointsManager.searchPointByName(name: criteria.text ?? "");
        }
        // Tags
        else{
            self.point = PointsManager.searchPointByTags(tags: criteria.text ?? "")
        }
        
        if (self.point != nil) {
            self.result.text = "Point \(self.point!.name) found!"
            self.viewButton.isHidden = false
        }
        else{
            self.result.text = "Point \(criteria.text ?? "") not found."
            self.viewButton.isHidden = true
        }
        
    }
    
    @IBAction func viewTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SearchPointDetailsSegue", sender: nil)
    }
    
    // MARK: -Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PointDetailsVC;
        destination.point = self.point;
    }
    
}
