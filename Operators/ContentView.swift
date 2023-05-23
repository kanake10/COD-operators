//
//  ContentView.swift
//  Operators
//
//  Created by Ezra Kanake on 22/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = OperatorsApi()
    @State private var opac = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                OperatorView()
                    .opacity(opac)
            }
            .environmentObject(data)
            .onAppear {
                data.getData()
                
                withAnimation(.easeIn(duration: 2)) {
                    opac = 1.0
                }
            }
            .navigationTitle("COD Operators")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
