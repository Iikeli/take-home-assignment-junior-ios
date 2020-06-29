//
//  Product.swift
//  EasyShopper
//
//  Created by Morten Bek Ditlevsen on 11/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

struct Products : Codable {
    var products: [Product]
}

struct Product: Codable {
    var id: String
    var barcode: String?
    var name: String
    var description: String?
    var image_url: String
    var retail_price: Int
}
