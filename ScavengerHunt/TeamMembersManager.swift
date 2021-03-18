//
//  TeamMembersManager.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-18.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class TeamMembersManager: NSObject {
    static var members: [TeamMember] = []
    
    static func addMember(member: TeamMember) -> Void{
        members.append(member)
    }
    
    static func editMember(index: Int, newData: TeamMember) -> Void{
        let member = members[index]
        member.name = newData.name
        member.id = newData.id
    }
    
//    static func searchMemberByName(name: String) -> TeamMember? {
//        for member in members{
//            if member.name == name {
//                return member;
//            }
//        }
//        return nil;
//    }
}
