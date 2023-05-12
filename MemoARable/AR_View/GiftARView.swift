//
//  ARView.swift
//  MemoARable
//
//  Created by Lina on 12/05/2023.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

class GiftARView : ARView, ARCoachingOverlayViewDelegate {
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOvelay()
        subscribeToActionStream()
        
    }
    
    private var cancellables: Set<AnyCancellable> = []
    private var arModel: ARModel.Scene? = nil
    
    func subscribeToActionStream(){
        ARManager.shared.actionStream.sink(receiveValue: { [weak self] action in
            switch action {
            case .placeBlock(let color):
                self?.placeObj(ofColor: color)
                
            case .removeAllAnchors:
                self?.scene.anchors.removeAll()
                
            case .place3DModel:
                do{
                    let arModel = try ARModel.loadScene()
                    self?.scene.addAnchor(arModel)
                    self?.arModel = arModel
            
                }catch{
                    print(error)
                }
                
            case .modelAnimation:
                self?.arModel?.notifications.interactiveAction.post()
            }
        }).store(in: &cancellables)
 
    }
    
    func coachingOvelay(){
        let coatchingOverlay =  ARCoachingOverlayView()
        coatchingOverlay.autoresizingMask = [
              .flexibleWidth, .flexibleHeight
            ]
        coatchingOverlay.session = self.session
        coatchingOverlay.delegate = self
        coatchingOverlay.goal = .horizontalPlane
        
        coatchingOverlay.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(coatchingOverlay)
        
        NSLayoutConstraint.activate([
            coatchingOverlay.centerXAnchor.constraint(equalTo: centerXAnchor),
            coatchingOverlay.centerYAnchor.constraint(equalTo: centerYAnchor),
            coatchingOverlay.widthAnchor.constraint(equalTo: widthAnchor),
            coatchingOverlay.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
    }
    
    func placeObj(ofColor color: Color) {
        //let configuration = ARWorldTrackingConfiguration()
        //session.run(configuration)
        
        //let coordinateAnchor = AnchorEntity(world: .zero)
        //scene.addAnchor(coordinateAnchor)
      
        //to detect plane
       // let _ = AnchorEntity(plane: .horizontal)
        
        //to track image marker
        //let _ = AnchorEntity(.image(group: "", name: ""))
        
        //let _ = try? Entity.load(named: "")
        
        let black = MeshResource.generateBox(size: 1)
        let meterial = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: black, materials: [meterial])
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        scene.addAnchor(anchor)
 
        
    }
  
    
}

