RecordingButton
======

[![Version](https://img.shields.io/cocoapods/v/RecordingButton.svg?style=flat)](http://cocoadocs.org/docsets/RecordingButton)
[![Platform](https://img.shields.io/cocoapods/p/RecordingButton.svg?style=flat)](http://cocoadocs.org/docsets/RecordingButton)

RecordingButton can show dots animation for recording status.

```swift
import UIKit
import RecordingButton

class ExampleViewController: UIViewController {
    let recordingButton = UIButton()
    var isRecording = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }

    func setupButton() {
        recordingButton.addTarget(self, action: #selector(switchButtonState), for: .touchUpInside)
    }

    @objc func switchButtonState() {
        if isRecording {
            recordingButton.stopAnimation()
            recordingButton.setTitle("録音開始", for: .normal)
        } else {
            recordingButton.startAnimation()
            recordingButton.setTitle("録音終了", for: .normal)
        }
        isRecording.toggle()
    }
}
```

## Requirements

- Swift 5.0 or later
- iOS 9.3 or later

## Installation

#### [CocoaPods](https://github.com/cocoapods/cocoapods)

- Insert `pod 'RecordingButton', '~> 1.0'` to your Podfile.
- Run `pod install`.
