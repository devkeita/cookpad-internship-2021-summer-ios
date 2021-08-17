//
//  CartPageView.swift
//  MiniMart
//
//  Created by 青山慶大 on 2021/08/17.
//

import SwiftUI

struct CartPageView: View {
    @State var isAlertPresented: Bool = false
    @EnvironmentObject var cartState: CartState
    @Binding var isCartViewPresented: Bool

    var body: some View {
        VStack {
            List(cartState.cartItems, id: \.product.id) { cartItem in
                HStack(alignment: .top) {
                    RemoteImage(urlString: cartItem.product.imageUrl)
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading, spacing: 8) {
                        Text(cartItem.product.name)
                        Text("\(cartItem.product.price)円")
                        Text("\(cartItem.quantity)個")
                    }
                    .padding(.vertical, 8)
                }
            }
            VStack(spacing: 15) {
                Divider()
                Text("合計:\(cartState.calcTotalAmount())円")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Divider()
                Button(action: {
                    self.isAlertPresented = true
                }) {
                    Text("注文する")
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10.0)
                        .frame(maxWidth: .infinity)
                }
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(10.0)
                .padding(.horizontal, 10.0)
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(
                    title: Text("注文しました"),
                    message: nil,
                    dismissButton: Alert.Button.default(Text("OK")) {
                        isCartViewPresented = false
                        cartState.resetCart()
                    }
                )
            }
        }
        .navigationTitle("カート")
    }
}

struct CartPageView_Previews: PreviewProvider {
    @State static var isCartViewPresented: Bool = false
    static var previews: some View {
        NavigationView {
            CartPageView(isCartViewPresented: $isCartViewPresented)
        }
    }
}
