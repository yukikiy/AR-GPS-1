//
//  Coordinator.swift
//  AR-GPS-1
//
//  Created by 箕作勇輝 on 3/4/23.
//

import Foundation
import RealityKit
import ARKit
import CoreLocation

class Coordinator: NSObject, CLLocationManagerDelegate ,ARCoachingOverlayViewDelegate{
    var arView: ARView?
    let locationManager = CLLocationManager()
    var currentLocaion: CLLocation?
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocaion = locations.first
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        //put entity using latitude and longtitude
        let coordinate = CLLocationCoordinate2D(latitude: 35.58800969819105, longitude:139.7042739537916)
        let geoAnchor = ARGeoAnchor(coordinate: coordinate)
        let anchorEntity = AnchorEntity(anchor: geoAnchor)
        let modelEntity = ModelEntity(mesh: MeshResource.generateBox(size: 0.3))
        anchorEntity.addChild(modelEntity)

        arView?.session.add(anchor: geoAnchor)
        arView?.scene.addAnchor(anchorEntity)
        
    }
    
}

