//
//  TeamMember.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-18.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class TeamMember: NSObject {
    public var name: String
    public var id: String
    
    init(name: String, id: String){
        self.name = name
        self.id = id
    }
}
