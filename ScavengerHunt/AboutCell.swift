//
//  AboutCell.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-18.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var idField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        TeamMembersManager.editMember(index: self.idField.tag, newData: TeamMember.init(name: self.nameField.text ?? "", id: self.idField.text ?? ""))
    }
    
    @IBAction func emailTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "EmailTeamMember"), object: nil, userInfo: nil);
    }
}
