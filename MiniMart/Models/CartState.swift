//
//  CartState.swift
//  MiniMart
//
//  Created by 青山慶大 on 2021/08/17.
//

import Foundation
import Combine

final class CartState: ObservableObject {
    @Published var products: [FetchProductsQuery.Data.Product] = []
    func addCart(product: FetchProductsQuery.Data.Product) {
        self.products.append(product)
    }
}
