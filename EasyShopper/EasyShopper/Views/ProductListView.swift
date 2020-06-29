//
//  ProductListView.swift
//  EasyShopper
//
//  Created by Iiro Alhonen on 29.6.2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import SwiftUI

struct ProductListView: View {
    
    @Binding var cart: [Product]
    
    @State var products = [Product]()
    
    var body: some View {
        List(products, id: \.id) { item in
            HStack {
                Text(item.name)
                Spacer()
                Text(String(item.retail_price))
                Button(action: {
                    self.cart.append(item)
                    print(self.cart)
                }) {
                    Image(systemName: "plus")
                }
            }
        }.onAppear(perform: loadData)
    }
    
    
    func loadData() {
        guard let url = URL(string: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Products.self, from: data) {
                    DispatchQueue.main.async {
                        self.products = decodedResponse.products
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

}
