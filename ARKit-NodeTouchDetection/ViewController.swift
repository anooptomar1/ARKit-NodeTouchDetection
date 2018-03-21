import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    var arView: TouchARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView = TouchARView()
        view.addSubview(arView)
        
        //Arrangement of objects reacting to taps
        let cubeNode = exTouchableNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        cubeNode.position = SCNVector3(0, 0.3, -0.2)
        cubeNode.setId(id: 10)
        
        arView.addNode(node: cubeNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        arView.run()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        arView.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

