//
//  ErrorView.swift
//  APIDemo
//
//  Created by Srinivas Gadda on 19/11/23.
//

import SwiftUI

#Preview {
    ErrorView(errorString: "test")
}

struct ErrorView: View {
    var errorString: String
    @State private var showErrorPrompt = false
    
    var body: some View {
        Text(errorString)
            .onAppear() {
                showErrorPrompt = true
            }
            .alert("Error", isPresented: $showErrorPrompt, presenting: errorString) { errorMsg in
                /*Button(role: .destructive) {
                    
                } label: {
                    Text("OK")
                }*/
            } message: { errorMsg in
                Text(errorMsg)
            }
    }
}
