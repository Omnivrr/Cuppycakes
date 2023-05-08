//
//  Store.swift
//  Cuppycakes
//
//  Created by Bukhari Abdulkadir on 03/05/2023.
//
import SwiftUI

struct Store: View {
    @State var showCart = false
    @State var goToCart = false
    @State var showProfile = false
    @State var openMenu = false
    @State var searchText = ""

    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    var items: [[Any]] =  shopItems

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .top) {
                    Color.pink
                        .frame(height: 150)
                        .edgesIgnoringSafeArea(.top)

                    VStack(spacing: 10) {
                        HStack {
                            Button(action: {
                                openMenu = true
                            }) {
                                Image(systemName: "line.3.horizontal")
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        self.openMenu =  true
                                    }
                            }

                            Spacer()

                            Text("Cuppy Cupcakes")
                                .foregroundColor(.white)
                                .font(.custom("Avenir-Medium", size: 25))
                                .frame(width: 200, alignment: .center)

                            Spacer()

                            Button(action: {
                                showCart = true
                            }) {
                                Image(systemName: "cart")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal)

                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)

                            TextField("Search...", text: $searchText)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 7)
                                .background(Color.white)
                                .cornerRadius(8)
                                .textFieldStyle(PlainTextFieldStyle())

                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                   
                }

                ScrollView() {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(0..<items.count, id: \.self) { item in
                            storeItem(imageName: items[item][0] as! String, title: items[item][1] as! String, price: items[item][2] as! Double, color: items[item][3] as! Color, selfIndex: item)
                        }
                    }
                }
                .padding(.top, -35)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                EmptyView() // Add an empty view to hide the default toolbar
            }
            .sheet(isPresented: $showCart) {
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
