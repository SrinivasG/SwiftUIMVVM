//
//  ProductsListView.swift
//  APIDemo
//
//  Created by Srinivas Gadda on 19/11/23.
//

import SwiftUI

struct ProductsListView: View {
    var products: [Product]
    var body: some View {
        List(products) { product in
            NavigationLink(destination: ProductDetailView(product: product)) {
                ProductView(product: product)
            }
        }
    }
}

struct ProductView: View {
    var product: Product
    var body: some View {
        ThumbnailView(thumbnailURL: product.thumbnail)
        VStack(alignment: .leading, content: {
            Text(product.title)
            Text(product.brand)
            Text("$\(product.price)")
        })
    }
}
