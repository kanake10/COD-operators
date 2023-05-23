//
//  ApiClient.swift
//  Operators
//
//  Created by Ezra Kanake on 22/05/2023.
//

import Foundation
import SwiftUI

struct OperatorsModel : Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var unit: String
}

@MainActor class OperatorsApi: ObservableObject {
    @Published var operators: [OperatorsModel] = []
    
    func getData() {
        guard let url = URL(string: "https://modern-warfare.onrender.com/operators") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Check if there's data, otherwise return an error object
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.operators = [OperatorsModel(id: 0,name: "cod", image:"imageurl",unit: "unit")]
                }
                return }
            
            let operatorData = try! JSONDecoder().decode([OperatorsModel].self, from: data)
            
            // Update the list to the latest data
            DispatchQueue.main.async {
                print("Loaded new data successfully! Articles: \(operatorData.count)")
                self.operators = operatorData
            }
        }.resume()
    }
}
