//
//  SkillTableViewController.swift
//  XbitApp
//
//  Created by Erik Kellenter on 21.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class SkillTableViewController: UITableViewController, SkillUpdateProtocol {
    
//    let db = Firestore.firestore()
//    let storage = Storage.storage()
    
    var skills = [Skill]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        loadSampleSkills()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }
    
    func skillsUpdated(skill: Skill) {
        self.skills.append(skill)
        self.tableView.reloadData()
    }
    
    func loadSampleSkills() {
        
        FirebaseConnection.setupSkillProtocol(skillUpdateProtocol: self)
        
//                let skill1 = Skill(skill: "Swift", image: #imageLiteral(resourceName: "swift"))
//                let skill2 = Skill(skill: "Java", image: #imageLiteral(resourceName: "java"))
//                let skill3 = Skill(skill: "iOS", image: #imageLiteral(resourceName: "iOS"))
//                let skill4 = Skill(skill: "Android", image: #imageLiteral(resourceName: "android"))
//
//                skills += [skill1, skill2, skill3, skill4]
        
//        db.collection("skills").addSnapshotListener { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                self.skills.removeAll()
//                for document in querySnapshot!.documents {
//                    let storageRef = self.storage.reference()
//
//                    let imageRef = storageRef.child(document.data()["skill_image_name"] as! String)
//
//                    imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//                        if let error = error {
//                            print(error)
//                        } else {
//                            // Data for "images/island.jpg" is returned
//                            let image = UIImage(data: data!)
//
//                            let skill = Skill(skill: document.data()["skill_name"] as! String, image: image)
//
//                            self.skills.append(skill)
//                            self.tableView.reloadData()
//                        }
//                    }
//                }
//            }
//        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "SkillCellIdentifier"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? SkillTableViewCell else {
            fatalError()
        }
        
        let skill = skills[indexPath.row]
        cell.setup(skill: skill)
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
