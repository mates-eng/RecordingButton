//
//  ViewController.swift
//  Demo
//
//  Created by shintot on 2019/12/17.
//  Copyright © 2019 Mates Inc. All rights reserved.
//

import UIKit
import RecordingButton

class ViewController: UIViewController {
    @IBOutlet weak var recordingButton: UIButton!
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

