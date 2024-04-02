//
//  ThumbnailView.swift
//  APIDemo
//
//  Created by Srinivas Gadda on 19/11/23.
//

import SwiftUI

struct ThumbnailView: View {
    var thumbnailURL: String
    var body: some View {
        if let url = URL(string: thumbnailURL) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .failure(_):
                    Color.purple
                case .success(let image):
                    image.resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .cornerRadius(10)
                @unknown default:
                    Color.red
                }
            }
        } else {
            EmptyView()
        }
    }
}
