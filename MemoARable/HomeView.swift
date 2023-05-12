//
//  HomeView.swift
//  MemoARable
//
//  Created by Lina on 13/05/2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("You Got a MemoARable Gift from you friend Loole")
                
                NavigationLink {
                    ARSceneView()
                } label: {
                    Text("Redeem Your Gift")
                        .frame(width: 300, height: 50)
                        .padding()
                        .background(.regularMaterial)
                        .cornerRadius(16)
                }

               
            }
        }
 
        
    }
}
