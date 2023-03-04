//
//  ARView + Extension.swift
//  AR-GPS-1
//
//  Created by 箕作勇輝 on 3/4/23.
//

import Foundation
import RealityKit
import ARKit

extension ARView {
    
    func setupCoachingOverlay(_ delegate: Coordinator) {
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = self.session
        coachingOverlay.goal = .geoTracking
        coachingOverlay.delegate = delegate

        self.addSubview(coachingOverlay)

    }
    
}
