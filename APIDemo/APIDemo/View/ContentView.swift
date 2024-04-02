//
//  ContentView.swift
//  APIDemo
//
//  Created by Srinivas Gadda on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    @Bindable private var networkMonitor = Monitor()
    @Bindable private var viewModel = ProductsVM()
    
    var body: some View {
        NavigationStack {
            if networkMonitor.status == .connected {
                if viewModel.errorString.isEmpty {
                    ProductsListView(products: viewModel.products)
                        .navigationTitle("Products")
                    
                } else {
                    ErrorView(errorString: viewModel.errorString)
                }
                
            } else {
                ErrorView(errorString: "No network connection")
            }
                
        }
        .task {
            if networkMonitor.status == .connected {
                Task {
                    await viewModel.fetchProductsList()
                }
                //viewModel.fetchProductsList()
            }
        }
    }
}

//async let can be used to trigger multiple services in parallel
/*
 async let products1 = viewModel.fetchProductsList()
 async let products2 = viewModel.fetchProductsList()
 let products = await (products1, products2)
 */
#Preview {
    ContentView()
}
