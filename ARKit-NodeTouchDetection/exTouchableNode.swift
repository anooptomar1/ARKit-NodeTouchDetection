import UIKit
import SceneKit
import ARKit

public class exTouchableNode: TouchableNode {
    public var id: Int!
    
    override init(){
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public /*not inherited*/ init(geometry: SCNGeometry?){
        super.init()
        self.geometry = geometry
    }
    
    public func setId(id: Int){
        self.id = id
    }
    
    //タップに対する処理
    override func TouchedReaction() {
        print("ID: " + String(id))
    }
}
