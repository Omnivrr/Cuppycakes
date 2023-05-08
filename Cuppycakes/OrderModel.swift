//
//  OrderModel.swift
//  Cuppycakes
//
//  Created by Bukhari Sani on 08/05/2023.
//

import Foundation
import SwiftUI

class OrderModel: ObservableObject {
    @Published var name: String = ""
    @Published var streetAddress: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
    
    var isFormValid: Bool {
        !name.isEmpty && !streetAddress.isEmpty && !city.isEmpty && !zip.isEmpty
    }
}

struct OrderFormView: View {
    @ObservedObject var orderModel = OrderModel()
    @Binding var showOrderForm: Bool 
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("Name", text: $orderModel.name)
                TextField("Street Address", text: $orderModel.streetAddress)
                TextField("City", text: $orderModel.city)
                TextField("Zip", text: $orderModel.zip)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button(action: {
                    if orderModel.isFormValid {
                        // Place order
                        print("Order placed")
                    } else {
                        // Show validation error
                        print("Please fill in all fields")
                    }
                }) {
                    Text("Place Order")
                }
                .disabled(!orderModel.isFormValid)
            }
        }
        .navigationTitle("Order Form")
    }
}

