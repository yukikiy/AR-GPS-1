//
//  ContentView.swift
//  AR-GPS-1
//
//  Created by 箕作勇輝 on 3/4/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}
//ARViewをswiftに変換している
struct ARViewContainer: UIViewRepresentable {
    
    
    
    func makeUIView(context: Context) -> ARView {
        //configを設定
        let arView = ARView(frame: .zero)
        let session = arView.session
        let config = ARGeoTrackingConfiguration()
        config.planeDetection = .horizontal
        session.run(config)
        
        //ARの処理をcoordinatorで行うのでcoordinatorに情報を渡します
        context.coordinator.arView = arView
        //ARView＋ExtensionファイルからCoachingOvelayViewをarviewに追加する関数を呼ぶ
        arView.setupCoachingOverlay(context.coordinator)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    
    
    
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
