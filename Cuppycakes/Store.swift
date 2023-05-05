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
    @State var showProfile = false
    @State var openMenu = false
    
    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    var items: [[Any]] = shopItems
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                
                ScrollView() {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(0..<items.count, id: \.self) { item in
                            storeItem(imageName: items[item][0] as! String, title: items[item][1] as! String, price: items[item][2] as! Double, color: items[item][3] as! Color, selfIndex: item)
                        }
                    }
                }.padding(12)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            showProfile = true
                            
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.pink)
                        }
                    }
                
                ToolbarItem(placement: .principal) {
                    Text("Cuppy Cupcake")
                        .foregroundColor(.pink)
                        .font(.custom("Avenir-Medium", size: 27))
                    
                }
                
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCart = true
                    }) { Spacer()
                        Image(systemName: "cart")
                            .foregroundColor(.pink)
                    }
                }
            } .sheet(isPresented: $showCart) {
                Cart()
            }
        }
    }
}

struct Store_Previews: PreviewProvider {
    static var previews: some View {
        Store()
    }
}
