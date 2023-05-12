//
//  ContentView.swift
//  MemoARable
//
//  Created by Lina on 12/05/2023.
//

import SwiftUI

struct ARSceneView: View {
    @State private var colors: [Color] = [
        .green,
        .blue,
        .red
    ]
    var body: some View {
        
        GiftARViewRepresentable()
            .ignoresSafeArea()
            .overlay(alignment: .bottom, content: {
                ScrollView(.horizontal){
                    HStack {
                        Button("Place"){
                            ARManager.shared.actionStream.send(.place3DModel)
                            
                        }
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                        
                        Button("360"){
                            ARManager.shared.actionStream.send(.modelAnimation)
                            
                        }
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                            
                            
                        
                        Button{
                            ARManager.shared.actionStream.send(.removeAllAnchors)
                            
                        }label: {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                            
                        }
                        
                        ForEach(colors, id: \.self) { color in
                            Button{
                                ARManager.shared.actionStream.send(.placeBlock(color: color))
                                
                            }label: {
                                color
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(.regularMaterial)
                                    .cornerRadius(16)
                                
                            }
                        }
                    }.padding()
                }
            }
            )
    }
    
}
