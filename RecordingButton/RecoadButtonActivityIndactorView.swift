//
//  RecoadButtonActivityIndactorView.swift
//  RecodingButton
//
//  Created by shintot on 2019/12/17.
//  Copyright © 2019 Mates Inc. All rights reserved.
//

import UIKit

class RecoadButtonActivityIndactorView: UIActivityIndicatorView {
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: .TouchActivityIndacotrViewNotification, object: self)
        super.touchesEnded(touches, with: event)
    }
}
