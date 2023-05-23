//
//  OperatorComponent.swift
//  Operators
//
//  Created by Ezra Kanake on 23/05/2023.
//

import SwiftUI
import CachedAsyncImage

struct OperatorPreview: View {
    let name: String
    let image: String
    let unit: String
    
    var body: some View {
        
            HStack(alignment: .center) {
                CachedAsyncImage(url: URL(string: image), transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width: 180, height: 190)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .transition(.opacity)
                    } else {
                        HStack {
                            // Insert your placeholder here
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                
                    Text("Name:")
                        .foregroundColor(.blue)
                         +
                    Text(" \(name)")
                        .foregroundColor(.white)
                    
                    Spacer().frame(height: 6)
                    
                    Text("Unit:")
                        .foregroundColor(.blue)
                         +
                    Text(" \(unit)")
                        .foregroundColor(.white)
                        
            
                
            }
        }
    }
}

struct OperatorView_Previews: PreviewProvider {
    static var previews: some View {
        OperatorPreview(name: "Title", image: "testurl", unit: "Code")
    }
}
