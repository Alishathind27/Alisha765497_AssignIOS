//
//  ViewController.swift
//  Alisha_765497_FA_IOS
//
//  Created by Alisha Thind on 2020-01-24.
//  Copyright © 2020 Alisha Thind. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var idTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var priceTxtField: UITextField!
    @IBOutlet weak var descTxtField: UITextView!
    
    var Prod: [Products]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      loadData()
               let p1 = Products(id: 1, name: "Mobile Phone", description: "a", price: 1000)
               let p2 = Products(id: 2, name: "Steamer", description: "abc", price: 50)
               let p3 = Products(id: 3, name: "computer", description: "hsh", price: 60)
               let p4 = Products(id: 4, name: "mouse", description: "hds", price: 60)
               let p5 = Products(id: 5, name: "keyboard", description: "gg", price: 70)
               let p6 = Products(id: 6, name: "Ipad", description: "srgg", price: 80)
               let p7 = Products(id: 7, name: "phonecase", description: "gchjsg", price: 90)
               let p8 = Products(id: 8, name: "heater", description: "dhs", price: 100)
               let p9 = Products(id: 9, name: "Toaster", description: "jdi", price: 50)
               let p10 = Products(id: 10, name: "Mixer", description: "csdg", price: 50)
               
                Prod = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10]
        
        for i in Prod!
        {
            Products.products.append(i)
        }
        
        idTxtField.text = "\(p1.id)"
        nameTxtField.text = "\(p1.name)"
        priceTxtField.text = "\(p1.price)"
        descTxtField.text = "\(p1.description)"
        DeleteCoreData()
        loadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveData), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    
    @IBAction func addProduct(_ sender: UIButton) {

//        idTxtField.text = ""
//        nameTxtField.text = ""
//        priceTxtField.text = ""
//        descTxtField.text = ""
//        
//        let Id = Int(idTxtField.text ?? "0") ?? 0
//        let Name = nameTxtField.text ?? ""
//        let Price = Int(priceTxtField.text ?? "") ?? 0
//        let Desc = descTxtField.text ?? ""
//        
//        let product = Products(id: Id, name: Name, description: Desc, price: Price)
//        Prod?.append(product)
//        
        }
    
    
    @objc func saveData(){
        
        DeleteCoreData()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
               let Context = appDelegate.persistentContainer.viewContext
               
               for i in Prod! {
                   let bookEntity = NSEntityDescription.insertNewObject(forEntityName: "Product", into: Context)
                   bookEntity.setValue(i.id, forKey: "id")
                   bookEntity.setValue(i.name, forKey: "name")
                   bookEntity.setValue(i.description, forKey: "desc")
                   bookEntity.setValue(i.price, forKey: "price")
                   
                   // save context
                   do {
                       try Context.save()
                       
                   } catch {
                       print(error)
                   }
               }
    }
    
    func loadData(){
        Prod = [Products]()
              let appDelegate = UIApplication.shared.delegate as! AppDelegate
              let Context = appDelegate.persistentContainer.viewContext
              let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
              do {
                         let results = try Context.fetch(fetchRequest)
                         if results is [NSManagedObject] {
                             for result in results as! [NSManagedObject] {
                                 let id = result.value(forKey: "id") as! Int
                                 let name = result.value(forKey: "name") as! String
                                 let description = result.value(forKey: "desc") as! String
                                 let price = result.value(forKey: "price") as! Int
                                 
                                Prod?.append(Products(id: id, name: name, description: description, price: price))
                             }
                         }
                     } catch {
                         print(error)
                     }
                     }
    
    func DeleteCoreData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
               
               let Context = appDelegate.persistentContainer.viewContext
            
               let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
               
               fetchRequest.returnsObjectsAsFaults = false
               
               do {
                   let results = try Context.fetch(fetchRequest)
                   for managedObjects in results {
                       if let managedObjectData = managedObjects as? NSManagedObject {
                           Context.delete(managedObjectData)
                       }
                   }
               } catch {
                   print(error)
               }
               
    }
   
    
    }
    



