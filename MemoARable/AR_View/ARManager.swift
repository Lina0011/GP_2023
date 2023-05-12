//
//  ARManager.swift
//  MemoARable
//
//  Created by Lina on 12/05/2023.
//

import Combine

class ARManager {
    static let shared = ARManager()
    private init() {
        
    }
    
    var actionStream = PassthroughSubject<ARAction, Never>()
    
    
}
