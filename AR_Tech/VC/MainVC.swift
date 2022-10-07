
//
//  Technicalisto FCI
//


import UIKit
import RealityKit
import ARKit

class MainVC: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var arrayObjs:[String]! = ["1","2","3","4","5","6","7","8","9","10","11"]
    
    var selectedModel:String! = "model_1"
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        arView.session.delegate = self
        
        self.setupARView()
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
    }
    
    @objc
    func handleTap(recognizer:UITapGestureRecognizer){
        
        let location = recognizer.location(in: arView)

        let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)

        if let firstResult = results.first {

            let anchor = ARAnchor(name: self.selectedModel, transform: firstResult.worldTransform) // selectedModel

            arView.session.add(anchor: anchor)

            self.showToast(message: "You Add a New Object in your Place")

        }else{
            self.showToast(message: "Placement failed - coudn't find surface")
        }
        
    }

    func setupARView(){
        
        arView.automaticallyConfigureSession = false
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal,.vertical]
        configuration.environmentTexturing = .automatic
        arView.session.run(configuration)
        
    }
    
    // Controll
    
    func placeObject(named entityName:String , for anchor: ARAnchor) {
        
        let entity = try! ModelEntity.loadModel(named: entityName)
        
        entity.generateCollisionShapes(recursive: true)
        
        arView.installGestures([.all], for: entity) // translation, rotation and scale
        
        let anchorEntity = AnchorEntity(anchor: anchor)
        
        anchorEntity.addChild(entity)
        
        arView.scene.addAnchor(anchorEntity)
        
    }
}




