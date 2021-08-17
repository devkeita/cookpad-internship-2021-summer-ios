//
//  CartItem.swift
//  MiniMart
//
//  Created by 青山慶大 on 2021/08/17.
//

import Foundation

class CartItem {
    var product: FetchProductsQuery.Data.Product
    var quantity: Int
    
    init(product: FetchProductsQuery.Data.Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
}
