//
//  GiftARViewRepresentable.swift
//  MemoARable
//
//  Created by Lina on 12/05/2023.
//

import SwiftUI
import ARKit

struct GiftARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> GiftARView {
        let arView = GiftARView()
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        arView.session.run(config)
        arView.coachingOvelay()

        return arView
    }
    
    func updateUIView(_ uiView: GiftARView, context: Context) {}
    
}

