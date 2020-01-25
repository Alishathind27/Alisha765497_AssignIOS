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
        
        for i in Prod!
        {
            Products.products.append(i)
        }
        
        idTxtField.text = "\(Products.products[0].id)"
        nameTxtField.text = "\(Products.products[0].name)"
        priceTxtField.text = "\(Products.products[0].price)"
        descTxtField.text = "\(Products.products[0].description)"
    }
    
    
    @IBAction func addProduct(_ sender: UIButton) {
        
        idTxtField.text = ""
        nameTxtField.text = ""
        priceTxtField.text = ""
        descTxtField.text = ""
        
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
    
   
    
    }
    



