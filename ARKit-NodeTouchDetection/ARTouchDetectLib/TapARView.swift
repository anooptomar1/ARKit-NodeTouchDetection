import UIKit
import SceneKit
import ARKit

class TouchARView: ARSCNView, ARSCNViewDelegate{
    
    public init(){
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), options: nil)
        finishInitialization()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func finishInitialization() {
        delegate = self
        scene = SCNScene()
    }
    
    func setTouchGesture() {
        let nodeTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.nodeTap(_:)))
        topViewController()!.view.addGestureRecognizer(nodeTapGesture)
    }
    
    //このviewを呼び出すVCのviewWillAppear(_ animated: Bool) 中で呼ぶ
    public func run() {
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
        setTouchGesture()
    }
    
    //このviewを呼び出すVCのviewWillDisappear(_ animated: Bool) 中で呼ぶ
    public func pause() {
        session.pause()
    }
    
    //ノードの配置
    open func addNode(node: SCNNode){
        scene.rootNode.addChildNode(node)
    }
    
    //ノードに対するタッチを検出処理
    @objc func nodeTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        let point = gestureRecognizer.location(in: self)
        let hitResults = self.hitTest(point, options: [:])
        
        if hitResults.count > 0 {
            let result = hitResults[0]
            
            if let node = (result.node as? TouchableNode) {
                //TouchableNodeのサブクラスで定義されたタッチに対する処理を実行
                node.TouchedReaction()
            }
        }
    }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    // MARK: - ARSCNViewDelegate
    
    public func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    public func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    public func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

