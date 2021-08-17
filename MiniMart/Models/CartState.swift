//
//  CartState.swift
//  MiniMart
//
//  Created by 青山慶大 on 2021/08/17.
//

import Foundation
import Combine

final class CartState: ObservableObject {
    @Published var cartItems: [CartItem] = []
    @Published var cartItemCount: Int = 0
    func addCart(product: FetchProductsQuery.Data.Product) {
        let selectedCartItem = self.cartItems.filter({ $0.product.id == product.id }).first
        if selectedCartItem != nil {
            selectedCartItem?.quantity += 1
        } else {
            self.cartItems.append(CartItem(
                product: product,
                quantity: 1
            ))
        }
        cartItemCount += 1
    }
    
    func calcTotalAmount() -> Int {
        self.cartItems.reduce(0) { (sum, cartItem) -> Int in
            sum + (cartItem.quantity * cartItem.product.price)
        }
    }
    
    func resetCart() {
        self.cartItems = []
        self.cartItemCount = 0
    }
}
