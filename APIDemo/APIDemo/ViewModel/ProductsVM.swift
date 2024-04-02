//
//  ProductsVM.swift
//  APIDemo
//
//  Created by Srinivas Gadda on 18/11/23.
//

import Observation
import Foundation

let productsUrl = "https://dummyjson.com/products"

@Observable
class ProductsVM {
    var products: [Product] = []
    var errorString: String = ""
    
    func fetchProductsList() async {
        guard let url = URL(string: productsUrl) else {
            return
        }
        do {
            let response = try await loadProductsAsync(url)
            self.products = response.products
        } catch let error {
            print(error.localizedDescription)
        }
        /*self.loadProducts(url) { result in
            switch result {
            case .success(let model):
                self.products = model.products
            case .failure(let error):
                switch error {
                case .networkError:
                    self.errorString = "No network connection"
                case .parseError:
                    self.errorString = "Unable to parse the response"
                }
            }
        }*/
    }
    
    /*private func loadProducts(_ url: URL, completion: @escaping(Result<ProductsModel, CustomError>) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            if error != nil {
                completion(.failure(CustomError.parseError))
            }
            guard let data, let responseModel = try? JSONDecoder().decode(ProductsModel.self, from: data) else {
                completion(.failure(CustomError.parseError))
                return
            }
            completion(.success(responseModel))
            
        }.resume()
    }*/
    
    private func loadProductsAsync(_ url: URL) async throws -> ProductsModel {
        let (data, response) = try await URLSession.shared.data(from: url)
        if let response = response as? HTTPURLResponse, response.statusCode != 200 {
            throw CustomError.parseError
        }
        guard let responseModel = try JSONDecoder().decode(ProductsModel?.self, from: data) else {
            throw CustomError.parseError
        }
        return responseModel
    }
}

enum CustomError: Error {
    case networkError
    case parseError
}
