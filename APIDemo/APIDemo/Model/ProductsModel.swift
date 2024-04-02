//
//  ProductsModel.swift
//  APIDemo
//
//  Created by Srinivas Gadda on 18/11/23.
//

import Observation

struct ProductsModel: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Float
    let rating: Float
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
