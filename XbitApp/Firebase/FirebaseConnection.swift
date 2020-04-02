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
    

    static func setupSkillProtocol(skillUpdateProtocol: SkillUpdateProtocol) {
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
                
                for document in querySnapshot.documents {
                    let skillImageName = document.data()["skill_image_name"] as! String
                    
                    let storageRef = storage.reference()
                    
                    let imageRef = storageRef.child(skillImageName)
                    
                    imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print(error)
                        } else {
                            // Data for "images/island.jpg" is returned
                            let image = UIImage(data: data!)
                            let skillName = document.data()["skill_name"] as! String
                            
                            let skill = Skill(skill: skillName, image: image)
                            skillUpdateProtocol.skillsUpdated(skill: skill)
                        }
                    }
                }
            }
        })
    }
}
