//
//  Shop.swift
//  GroceryAppTut
//
//  Created by Ahmed Gagan on 15/01/23.
//

import SwiftUI

struct Store: View {
    @State var showCart = false
    @State var goToCart = false
    
    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    var items: [[Any]] = shopItems
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                VStack { Text("Cuppy Cupcakes")
                    
                        .foregroundColor(Color.black)
                        .font(.custom("Avenir-Medium", size: 35))
                        .frame(width: 300, alignment: .leading)
                }
                ScrollView() {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(0..<items.count, id: \.self) { item in
                            storeItem(imageName: items[item][0] as! String, title: items[item][1] as! String, price: items[item][2] as! Double, color: items[item][3] as! Color, selfIndex: item)
                        }
                    }
                }.padding(12)
            }
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showCart = true
                        }) { Spacer()
                            Image(systemName: "cart")
                                .foregroundColor(.black)
                        }
                    }
                }
                .sheet(isPresented: $showCart) {
                    Cart()
                }
        }
    }
}

struct Shop_Previews: PreviewProvider {
    static var previews: some View {
        Store()
    }
}
