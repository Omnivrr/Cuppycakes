//
//  splitScreen.swift
//  Cuppycakes
//
//  Created by Bukhari Sani on 03/05/2023.
//

import SwiftUI

struct splitScreen: View {
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
            
            Image("NiceCupcake")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(10)
                .scaleEffect(scale)
                .animation(
                    Animation.easeInOut(duration: 0.3)
                        .repeatCount(3, autoreverses: true))
                .onAppear {
                    self.scale = 1.5
            }
        }
    }
}

struct splitScreen_Previews: PreviewProvider {
    static var previews: some View {
        splitScreen()
    }
}
