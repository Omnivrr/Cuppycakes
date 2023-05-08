//
//  Cart.swift
//  Cuppycakes
//
//  Created by Bukhari Sani on 04/05/2023.


import SwiftUI

struct Cart: View {
    @State var totalPrice = 0.0
    @State var showOrderForm = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("My Cart")
                    .font(.system(size: 44, weight: .semibold, design: .rounded))
                    .frame(width: 320, alignment: .leading)
                List {
                    ForEach(0..<cartItems.count, id:\.self) { item in
                        HStack {
                            Image(cartItems[item][0] as! String)
                                .resizable()
                                .frame(width: 40, height: 40)
                            VStack(spacing: 5) {
                                Text(cartItems[item][1] as! String)
                                Text("$\(String(format: "%.2f", cartItems[item][2] as! Double))")
                                    .foregroundColor(.gray)
                            }
                        }
                    }.onDelete { indexSet in
                        cartItems.remove(atOffsets: indexSet)
                        self.calculateTotalPrice()
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
                        self.showOrderForm = true
                    }) {
                        Text("Checkout")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .frame(width: 120, height: 40)
                            .background(Color.pink)
                            .cornerRadius(15)
                    }.offset(x: 80)
                    .buttonStyle(PlainButtonStyle())
                }
            }.onAppear(perform: self.calculateTotalPrice)
            .sheet(isPresented: $showOrderForm) {
                OrderFormView(orderModel: OrderModel(), showOrderForm: $showOrderForm)
            }
        }
    }
    
    func calculateTotalPrice() {
        totalPrice = cartItems.reduce(0.0) { $0 + ($1[2] as! Double) }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
