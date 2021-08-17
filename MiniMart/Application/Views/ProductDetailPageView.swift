//
//  ProductDetailPageView.swift
//  MiniMart
//
//  Created by 青山慶大 on 2021/08/17.
//

import SwiftUI

struct ProductDetailPageView: View {
    var product: FetchProductsQuery.Data.Product
    @State var isCartViewPresented: Bool = false
    @EnvironmentObject var cartState: CartState

    var body: some View {
        ScrollView {
            RemoteImage(urlString: product.imageUrl)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            VStack {
                Text(product.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                Spacer()
                    .frame(height: 20.0)
                HStack {
                    Text("\(product.price)")
                        .font(.title)
                    Text("円")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 20.0)
                Text(product.summary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 50.0)
                Button(action: {
                    cartState.addCart(product: product)
                }) {
                    Text("カートに追加")
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                }
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(10.0)
            }
            .padding(.horizontal, 10)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    self.isCartViewPresented = true
                }) {
                    Image(systemName: "folder")
                    Text("\(cartState.cartItemCount)")
                }
            }
        }
        .sheet(isPresented: $isCartViewPresented) {
            NavigationView {
                CartPageView()
            }
        }
    }
}

struct ProductDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailPageView(
                product: FetchProductsQuery.Data.Product(
                    id: UUID().uuidString,
                    name: "商品 \(1)",
                    price: 100,
                    summary: "おいしい食材 \(1)",
                    imageUrl: "https://image.mini-mart.com/dummy/1"
                )
            )
        }
    }
}
