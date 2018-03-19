import UIKit
import SceneKit
import ARKit

public class TouchableNode: SCNNode {
    
    override public init(){
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func TouchedReaction(){
        //ノードがタップされたときの処理を記述（オーバーライド）
    }
}
