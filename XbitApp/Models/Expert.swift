//
//  Expert.swift
//  XbitApp
//
//  Created by Erik Kellenter on 14.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

class Expert {
    //MARK: Properties
    var name: String
    var phoneNumber: String
    var email: String
    var thumbnailPath: String
    var skills: [Skill]?
    var role: String?
    
    init(name: String, phoneNumber: String, email: String, thumbnailPath: String, skills: [Skill]?, role: String?) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.thumbnailPath = thumbnailPath
        self.skills = skills
        self.role = role
    }
    
    init(firestoreData: [String : Any]) {
        self.name = firestoreData["name"] as! String
        self.phoneNumber = firestoreData["phone"] as! String
        self.email = firestoreData["email"] as! String
        self.thumbnailPath = firestoreData["thumbnail_name"] as! String
        self.skills = convertFirestoreSkillData(firebaseSkillData: firestoreData["skill_list"]!)
        
    }
    
    private func convertFirestoreSkillData(firebaseSkillData: Any) -> [Skill] {
        var skills = [Skill]()
        let skillMapList = firebaseSkillData as! [[String : Any]]
        for skillMap in skillMapList {
            let skillName = skillMap["skill_name"] as! String
            let skillRating = skillMap["skill_rating"] as! Int
            skills.append(Skill(skill: skillName, level: skillRating))
        }
        return skills
    }
}
