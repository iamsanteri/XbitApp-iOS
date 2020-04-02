//
//  FirebaseConnection.swift
//  XbitApp
//
//  Created by Erik Kellenter on 02.04.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

struct FirebaseConnection {
    
    static func setupSkillProtocol(skillUpdatedProtocol: SkillUpdateProtocol) {
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("skills").addSnapshotListener ({(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                guard let querySnapshot = querySnapshot else {
                    print("Snapshot does not exist")
                    return
                }
                
                var skills = [Skill]()
                
                for document in querySnapshot.documents {
                    let skillImageName = document.data()["skill_image_name"] as! String
                    
                    let storageRef = storage.reference()
                    
                    let imageRef = storageRef.child(skillImageName)
                    
                    // use Result and Grand Central Dispatch
                    imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print(error)
                        } else {
                            // Data for "images/island.jpg" is returned
                            let image = UIImage(data: data!)
                            let skillName = document.data()["skill_name"] as! String
                            
                            let skill = Skill(skill: skillName, image: image)
                            skills.append(skill)
                            
                            if skills.count == querySnapshot.documents.count {
                                skillUpdatedProtocol.skillsUpdated(skills: skills)
                            }
                        }
                    }
                }
            }
        })
    }
    
    static func setupExpertProtocol(expertUpdatedProtocol: ExpertUpdateProtocol) {
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("experts").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                guard let querySnapshot = querySnapshot else {
                    print("Snapshot does not exist")
                    return
                }
                                
                var experts = [Expert]()
                for document in querySnapshot.documents {
                                        
                    let storageRef = storage.reference()
                    
                    guard let thumbnail_name = document.data()["thumbnail_name"] else {
                        break
                    }
                    
                    let imageRef = storageRef.child(document.data()["thumbnail_name"] as! String)
                    
                    imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("Error loading images \(error)")
                        } else {
                            // Data for "images/island.jpg" is returned
                            let image = UIImage(data: data!)
                                                                        
                            let expert = Expert(name: document.data()["name"] as! String,
                                                phoneNumber: document.data()["phone"] as! String,
                                                email: document.data()["email"] as! String,
                                                photo: image,
                                                skills: [Skill(skill: "Swift", level: 5),
                                                         Skill(skill: "iOS", level: 2),
                                                         Skill(skill: "Scrum", level: 3)],
                                                role: document.data()["role"] as! String)
                            experts.append(expert)
                                                        
                            if experts.count == querySnapshot.documents.count {
                                expertUpdatedProtocol.expertsUpdated(experts: experts)
                            }
                        }
                    }
                }
            }
        }
    }
}
