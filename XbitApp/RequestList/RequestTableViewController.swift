//
//  RequestTableViewController.swift
//  XbitApp
//
//  Created by Santeri Liukkonen on 21.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

class RequestTableViewController: UITableViewController {
    
    //MARK: Properties
     
    var requests = [Request]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        loadSampleRequests()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RequestTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RequestTableViewCell else {
            fatalError("The dequeued cell is not an instance of RequestTableViewCell")
        }
        
        let request = requests[indexPath.row]
        
        cell.requestTitleLabel.text = request.title
        cell.requestBodyLabel.text = request.request
        cell.requestImage.image = request.image

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
    
    private func loadSampleRequests() {
        
        let request1 = Request(title: "Title of my outgoing request", request: "These are the first few lines of my request...", image: #imageLiteral(resourceName: "upload"))
        let request2 = Request(title: "Title of my incoming request", request: "This is an incoming request for you to answer...", image: #imageLiteral(resourceName: "download"))
        
        requests += [request1, request2]

    }

}
