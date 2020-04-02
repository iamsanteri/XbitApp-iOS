//
//  ExpertTableViewController.swift
//  XbitApp
//
//  Created by Erik Kellenter on 14.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit
//import FirebaseFirestore
//import FirebaseStorage

class ExpertTableViewController: UITableViewController, UINavigationControllerDelegate {
    
//    let db = Firestore.firestore()
//    let storage = Storage.storage()
    
    var experts = [Expert]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        
        self.navigationController?.navigationBar.barTintColor = UIColor.systemOrange
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        loadSampleExperts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = item
        let emptyImage = UIImage()
        navigationController.navigationBar.backIndicatorImage = emptyImage
        navigationController.navigationBar.backIndicatorTransitionMaskImage = emptyImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowDetail":
            guard let detailViewController = segue.destination as? DetailViewController else {
                fatalError()
            }
            
            guard let selectedExpertCell = sender as? ExpertTableViewCell else {
                fatalError()
            }
            
            guard let selectedIndex = tableView.indexPath(for: selectedExpertCell) else {
                fatalError()
            }
            
            let selectedExpert = experts[selectedIndex.row]
            detailViewController.expert = selectedExpert
            
        default:
            fatalError()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experts.count
    }
    
    private func loadSampleExperts() {
                let david = UIImage(named: "david")
                let daniel = UIImage(named: "daniel")
                let max = UIImage(named: "max")
        
        
                let expert1 = Expert(name: "David Symhoven", phoneNumber: "563", email: "david.symhoven@jambit.com", photo: david, skills: [Skill(skill: "Swift", level: 5), Skill(skill: "iOS", level: 2), Skill(skill: "Scrum", level: 3)], role: "Architect")
        
                let expert2 = Expert(name: "Daniel Benkmann", phoneNumber: "123", email: "daniel.benkmann@jambit.com", photo: daniel, skills: [], role: nil)
        
                let expert3 = Expert(name: "Max Mustermann", phoneNumber: "666", email: "max.mustermann@jambit.com", photo: max, skills: [], role: nil)
        
//        db.collection("experts").addSnapshotListener { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                self.experts.removeAll()
//                for document in querySnapshot!.documents {
//                    
//                    let storageRef = self.storage.reference()
//                    
//                    let imageRef = storageRef.child(document.data()["thumbnail_name"] as! String)
//                    
//                    imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//                        if let error = error {
//                            print(error)
//                        } else {
//                            // Data for "images/island.jpg" is returned
//                            let image = UIImage(data: data!)
//                            
//                            let expert = Expert(name: document.data()["name"] as! String, phoneNumber: document.data()["phone"] as! String, email: document.data()["email"] as! String, photo: image, skills: [Skill(skill: "Swift", level: 5), Skill(skill: "iOS", level: 2), Skill(skill: "Scrum", level: 3)], role: document.data()["role"] as! String)
//                            
//                            self.experts.append(expert)
//                            self.tableView.reloadData()
//                        }
//                    }
//                }
//            }
//        }
                experts += [expert1, expert2, expert3]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ExpertCellIdentifier"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ExpertTableViewCell else {
            fatalError()
        }
        
        let expert = experts[indexPath.row]
        cell.setup(with: expert)
        
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
