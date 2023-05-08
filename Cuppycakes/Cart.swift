//
//  Cart.swift
//  Cuppycakes
//
//  Created by Bukhari Sani on 04/05/2023.


import SwiftUI

struct Cart: View {
    @State var totalPrice = 0.0  // A state variable to hold the total price of items in the cart.
    @State var showOrderForm = false  // A state variable to toggle the visibility of the order form.
    
    var body: some View {
        NavigationView {
            VStack {
                Text("My Cart")
                    .font(.system(size: 44, weight: .semibold, design: .rounded))
                    .frame(width: 320, alignment: .leading)
                List {
                    // A loop to iterate through each item in the cart and display it in a list.
                    ForEach(0..<cartItems.count, id:\.self) { item in
                        HStack {
                            Image(cartItems[item][0] as! String)  // An image of the item.
                                .resizable()
                                .frame(width: 40, height: 40)
                            VStack(spacing: 5) {
                                Text(cartItems[item][1] as! String)  // The name of the item.
                                Text("$\(String(format: "%.2f", cartItems[item][2] as! Double))")  // The price of the item.
                                    .foregroundColor(.gray)
                            }
                        }
                    }.onDelete { indexSet in
                        cartItems.remove(atOffsets: indexSet)  // Remove the selected item(s) from the cart.
                        self.calculateTotalPrice()  // Recalculate the total price of the cart.
                    }
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.pink)
                        .opacity(0.8)
                        .frame(width: 350, height: 120)
                    VStack {
                        Text("Total Price")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                        Text("$\(String(format: "%.2f", totalPrice))")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                    }
                    Button(action: {
                        self.showOrderForm = true  // Set the order form to visible when the button is tapped.
                    }) {
                        Text("Checkout")  // The text to display on the button.
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .frame(width: 120, height: 40)
                            .background(Color.pink)
                            .cornerRadius(15)
                    }.offset(x: 80)
                    .buttonStyle(PlainButtonStyle())
                }
            }.onAppear(perform: self.calculateTotalPrice)  // Calculate the total price when the view appears.
            .sheet(isPresented: $showOrderForm) {
                OrderFormView(orderModel: OrderModel(), showOrderForm: $showOrderForm)  // Present the order form as a modal sheet.
            }
        }
    }
    
    func calculateTotalPrice() {
        totalPrice = cartItems.reduce(0.0) { $0 + ($1[2] as! Double) }  // Calculate the total price of the cart using a reduce function.
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()  // Preview the Cart view.
    }
}
