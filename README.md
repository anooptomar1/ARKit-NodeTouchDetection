# ARKit-NodeTouchDetection
Swift library for tap detection of objects in ARKit

# Usage
### Manual setting
 Please add `ARKit-NodeTouchDetection / ARKit-NodeTouchDetection / ARTouchDetectLib /` to the project.

### Part of sample code
Describe the processing when tapping an object installed in AR space inheriting from TouchableNode. <br>
By adding TouchARView to ViewVontroller's view, you can detect the tap to the object. <br>
For details, see `ARKit-NodeTouchDetection / ARKit-NodeTouchDetection / ViewController.swift`.

```swift
class ViewController: UIViewController {
  var arView: TouchARView!

  override func viewDidLoad() {
    super.viewDidLoad()

    arView = TouchARView()
    view.addSubview(arView)

    let sampleNode = exTouchableNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
    sampleNode.position = SCNVector3(0, 0.3, -0.2)

    //Place the node in AR space
    arView.addNode(node: sampleNode)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    arView.run()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    arView.pause()
  }
}

public class exTouchableNode: TouchableNode {
  override func TouchedReaction() {
      //Describe processing for taps
  }
}

```

## Limitation
If there are multiple objects at the tap position on the screen, only one of them can be detected.

## Requirements
- iOS 11.0
- Swift Version 3.0
