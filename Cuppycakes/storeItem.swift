//
//  storeItem.swift
//  Cuppycakes
//
//  Created by Bukhari Sani on 03/05/2023.
//

import SwiftUI

struct storeItem: View {
    var imageName: String
    var title: String
    var price: Double
    var color: Color
    var selfIndex: Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
                .shadow(radius: 2)
                .frame(width: 170, height: 240)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 170, height: 163)
                    .cornerRadius(10)
                Text(title)
                    .foregroundColor(.black)
                
                Button() {
                    cartItems.append(shopItems[selfIndex])
                } label: {
                    Text("$\(String(format: "%.2f", price))")
                        .foregroundColor(.white)
                        .frame(width: 80, height: 25)
                        .background(Color.pink)
                        .cornerRadius(7)
                
                    
                }
                Text("")
            }
        }
    }
}
    
    struct storeItem_Previews: PreviewProvider {
        static var previews: some View {
            storeItem(imageName: "Rainbowcupcake", title: "Rainbow cupcake", price: 2.00, color: Color.white, selfIndex: 0)
        }
    }
