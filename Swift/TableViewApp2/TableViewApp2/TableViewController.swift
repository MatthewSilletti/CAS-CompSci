//
//  TableViewController.swift
//  TableViewApp2
//
//  Created by Matthew Silletti on 11/8/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

//    let Boats:[String:[String]] = [
//        "Walter Boat": ["Fire Truck Red","Medium Size","12cc"],
//        "Alligator Boat": ["Alligator Color","Alligator Size","At Least 13cc"],
//        "Pirate Boat Ship": ["Black","Extra Large","200cc"],
//        "Canoe": ["White","Small/Medium","0cc"],
//        "Boomer Boat": ["Stupid Idiot Color","Small Like Boomers' Minds","-15cc"],
//        "Titanic": ["Ocean Blue","In Half","Fish Power"],
//        "House Boat": ["House Color","House Size","Family Of 5"],
//        "SS Kobie": ["Gray Smoke","Average Sized","Steam Engine"],
//        "SS SkyHerr": ["Butter Yellow","The Biggest","Pigs Running On Large Hampster Wheels"],
//    ]
    
    let boats:[Boat] = [
        Boat(n: "Walter", p: -12, c: "Fire Truck Red", s: "Big"),
        Boat(n: "Alligator Boat", p: 13, c: "Alligator Color", s: "Big Like Alligator"),
        Boat(n: "Canoe", p: 0, c: "Wood", s: "Small"),
        Boat(n: "Titanic", p: 100, c: "Ocean Blue", s: "In Half"),
        Boat(n: "SS Jayjay", p: -1000000000, c: "Ugly", s: "Dumb"),
        Boat(n: "House Boat", p: 30, c: "House Color", s: "Big"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return boats.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let title = boats[indexPath.row].name
        cell.textLabel!.text = title

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

    
    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        let bd = segue.destination as! ViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        let boat = self.boats[indexPath!.row]
        bd.boatName = boat.name
        bd.boatColor = boat.color
        bd.boatSize = boat.size
        bd.boatPower = "\(boat.power)"
    
    }
 
    
}
