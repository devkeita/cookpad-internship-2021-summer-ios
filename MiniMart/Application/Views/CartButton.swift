//
//  CartButton.swift
//  MiniMart
//
//  Created by 青山慶大 on 2021/08/17.
//

import SwiftUI

struct CartButton: View {
    @State var isCartViewPresented: Bool = false
    @EnvironmentObject var cartState: CartState

    var body: some View {
        Button(action: { self.isCartViewPresented = true }) {
            VStack {
                Image(systemName: "folder")
                Text("\(cartState.cartItemCount)")
            }
        }
        .sheet(isPresented: $isCartViewPresented) {
            NavigationView {
                CartPageView(isCartViewPresented: $isCartViewPresented)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
            .environmentObject(CartState())
    }
}
