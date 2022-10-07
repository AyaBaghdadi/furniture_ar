
//
//  Technicalisto FCI
//


import UIKit
import RealityKit
import ARKit

extension MainVC : ARSessionDelegate {
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        
        for anchor in anchors {
            
            if let anchorName = anchor.name, anchorName == self.selectedModel { // selectedModel
                placeObject(named: anchorName , for: anchor)
            }
            
        }
        
    }
}
