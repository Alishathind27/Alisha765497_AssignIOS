//
//  Product.swift
//  Alisha_765497_FA_IOS
//
//  Created by Alisha Thind on 2020-01-24.
//  Copyright © 2020 Alisha Thind. All rights reserved.
//

import Foundation

class Products{
    internal init(Id: Int, Name: String, Description: String, Price: Int) {
        self.id = Id
        self.name = Name
        self.description = Description
        self.price = Price
    }
    
    var id: Int
    var name: String
    var description: String
    var price: Int
    static var products = [Products]()
}


