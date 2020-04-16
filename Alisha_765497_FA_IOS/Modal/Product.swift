//
//  Product.swift
//  Alisha_765497_FA_IOS
//
//  Created by Alisha Thind on 2020-01-24.
//  Copyright © 2020 Alisha Thind. All rights reserved.
//

import Foundation

class Products{
    internal init(id: Int, name: String, description: String, price: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
    }
    
    
    
    var id: Int
    var name: String
    var description: String
    var price: Int
    static var products = [Products]()
}


