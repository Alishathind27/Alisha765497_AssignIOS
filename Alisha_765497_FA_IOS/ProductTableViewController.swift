//
//  ProductTableViewController.swift
//  Alisha_765497_FA_IOS
//
//  Created by Alisha Thind on 2020-01-24.
//  Copyright © 2020 Alisha Thind. All rights reserved.
//

import UIKit
import CoreData
class ProductTableViewController: UITableViewController {

    var Prod: [Products]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        var p1 = Products(Id: 1, Name: "Mobile Phone", Description: "a", Price: 1000)
        var p2 = Products(Id: 2, Name: "Steamer", Description: "abc", Price: 50)
        var p3 = Products(Id: 3, Name: "computer", Description: "hsh", Price: 60)
        var p4 = Products(Id: 4, Name: "mouse", Description: "hds", Price: 60)
        var p5 = Products(Id: 5, Name: "keyboard", Description: "gg", Price: 70)
        var p6 = Products(Id: 6, Name: "Ipad", Description: "srgg", Price: 80)
        var p7 = Products(Id: 7, Name: "phonecase", Description: "gchjsg", Price: 90)
        var p8 = Products(Id: 8, Name: "heater", Description: "dhs", Price: 100)
        var p9 = Products(Id: 9, Name: "Toaster", Description: "jdi", Price: 50)
        var p10 = Products(Id: 10, Name: "Mixer", Description: "csdg", Price: 50)
        
        Prod = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10]
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        return Prod?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)

        // Configure the cell...
        
       
        cell.textLabel?.text = Products.products[indexPath.row].name
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
    func loadData(){
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let Context = appDelegate.persistentContainer.viewContext
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
           do {
                      let results = try Context.fetch(fetchRequest)
                      if results is [NSManagedObject] {
                          for result in results as! [NSManagedObject] {
                              let id = result.value(forKey: "id") as! String
                              let name = result.value(forKey: "name") as! String
                              let description = result.value(forKey: "desc") as! Int
                              let price = result.value(forKey: "price") as! Int
                              
                           
                          }
                      }
                  } catch {
                      print(error)
                  }
                  }
    override func viewWillAppear(_ animated: Bool) {
//        loadData()
    }
}
