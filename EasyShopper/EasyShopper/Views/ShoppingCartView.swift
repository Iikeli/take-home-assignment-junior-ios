//
//  ShoppingCartView.swift
//  EasyShopper
//
//  Created by Iiro Alhonen on 29.6.2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import SwiftUI

struct ShoppingCartView: View {
    @State var cart: [Product] = []
    @State var isPresented = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Shopping cart")
                    .font(.title)
                Button(action: {
                    self.cart = []
                }) {
                    Image(systemName: "trash")
                }.padding(.leading, 50)
                
            }
            List {
                ForEach(cart, id: \.id) { product in
                    HStack {
                        Text(product.name)
                            .font(.headline)
                        Spacer()
                        Text(String(product.retail_price))
                        
                    }
                }
            }
            Spacer()
            Button(action: {
                self.isPresented.toggle()
            }) {
                Text("Add Products")
            }

        }
        .sheet(isPresented: $isPresented, onDismiss: { self.isPresented = false }) {
            ProductListView(cart: self.$cart)
        }
    }
}



struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView()
    }
}
