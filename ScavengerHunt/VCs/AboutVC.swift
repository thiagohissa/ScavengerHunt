//
//  AboutVC.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-18.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class AboutVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Team members
    // Alexander Balez ‐ 101219847
    // Kevin Ufkes ‐ 101197364
    // Thiago Maciel Hissa – 101176085
    // Barrington Venables ‐ 101189284
    var members: [TeamMember]!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamMembersManager.addMember(member: TeamMember.init(name: "Kevin Ufkes", id:"101197364"))
        TeamMembersManager.addMember(member: TeamMember.init(name: "Alexander Balez", id:"101219847"))
        TeamMembersManager.addMember(member: TeamMember.init(name: "Thiago Maciel Hissa", id:"101176085"))
        TeamMembersManager.addMember(member: TeamMember.init(name: "Barrington Venables", id:"101189284"))
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.emailTappedOnCell), name: NSNotification.Name(rawValue: "EmailTeamMember"), object: nil
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.members = TeamMembersManager.members
    }
    
    @objc func emailTappedOnCell() -> Void {
        
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        if(self.nameField.text != "" && self.idField.text != nil){
            TeamMembersManager.addMember(member: TeamMember.init(name: self.nameField.text!, id: self.idField.text!))
            self.members = TeamMembersManager.members
            self.tableView.reloadData()
            self.tableView.setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Please make sure all fields are completed", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK: -TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:AboutCell = tableView.dequeueReusableCell(withIdentifier: "AboutCell") as! AboutCell;
        cell.nameField.text = "\(self.members[indexPath.row].name)"
        cell.idField.text = "\(self.members[indexPath.row].id)"
        cell.idField.tag = indexPath.row
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    
    // MARK: -Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = segue.destination as! PointDetailsVC;
//        destination.point = self.selectedPoint;
    }
    
    

}
