# ARKit-NodeTouchDetection
Swift library for tap detection of objects in ARKit

# Usage
### 手動による設定
 `ARKit-NodeTouchDetection/ARKit-NodeTouchDetection/ARTouchDetectLib/` をプロジェクトに追加してください.

### サンプル
AR空間に設置するオブジェクトのタップ時の処理を、TouchableNode を継承して記述してください. <br>
TouchARView を ViewVontroller の view に追加するだけでオブジェクトへのタップが検知できます. <br>
詳細は `ARKit-NodeTouchDetection/ARKit-NodeTouchDetection/ViewController.swift` を見てください.

```
class ViewController: UIViewController {
  var arView: TouchARView!

  override func viewDidLoad() {
    super.viewDidLoad()

    arView = TouchARView()
    view.addSubview(arView)

    let sampleNode = exTouchableNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
    sampleNode.position = SCNVector3(0, 0.3, -0.2)

    //AR空間にノードを設置
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
      //タップに対する処理を記述
  }
}

```

## Requirements
- iOS 11.0
- Swift Version 3.0
