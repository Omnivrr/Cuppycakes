//
//  CuppycakesApp.swift
//  Cuppycakes
//
//  Created by Bukhari Sani on 03/05/2023.
//

import SwiftUI

@main
struct CuppycakesApp: App {
    @State private var showMainView = false
    
    var body: some Scene {
        WindowGroup {
            if showMainView {
                Store()
            } else {
               splitScreen()
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showMainView = true
                            
                    }
                }
            }
        }
    }
}
