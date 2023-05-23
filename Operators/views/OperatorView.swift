//
//  OperatorView.swift
//  Operators
//
//  Created by Ezra Kanake on 23/05/2023.
//

import SwiftUI

struct OperatorView: View {
    @EnvironmentObject var data : OperatorsApi
    @Environment(\.openURL) var openURL
    private var textWidth = 300.0
    
    var body: some View {
        List {
            ForEach(data.operators) { operators in
                OperatorPreview(
                    name: operators.name,
                    image: operators.image,
                    unit: operators.unit)
            }
        }
        .refreshable {
            data.getData()
        }
    }
    
    struct NewsView_Previews: PreviewProvider {
        static var previews: some View {
            OperatorPreview(name: "no0k3h", image: "image", unit: "cod")
                .environmentObject(OperatorsApi())
        }
    }
}
