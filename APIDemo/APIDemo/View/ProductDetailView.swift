//
//  ProductDetailView.swift
//  APIDemo
//
//  Created by Srinivas Gadda on 19/11/23.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    var body: some View {
        Text(product.description)
    }
}
