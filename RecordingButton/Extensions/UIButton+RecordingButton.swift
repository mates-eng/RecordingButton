//
//  UIButton+RecodingButton.swift
//  RecodingButton
//
//  Created by shintot on 2019/12/17.
//  Copyright © 2019 Mates Inc. All rights reserved.
//

import UIKit

extension UIButton: HasAssociatedObjects {
    var animationLayer: CAReplicatorLayer? {
        set { associatedObjects["animationLayerKey"] = newValue }
        get { return associatedObjects["animationLayerKey"] as? CAReplicatorLayer }
    }
    
    var animationIndactor: RecoadButtonActivityIndactorView? {
        set { associatedObjects["animationIndactorKey"] = newValue }
        get { return associatedObjects["animationIndactorKey"] as? RecoadButtonActivityIndactorView }
    }
    
    open var animationLoadingObjectColor: UIColor {
        set { associatedObjects["animationDotColorKey"] = newValue }
        get { return associatedObjects["animationDotColorKey"] as? UIColor ?? .black }
    }
    
    open var animationDotFromValue: CGFloat {
        set { associatedObjects["animationDotFromValueKey"] = newValue }
        get { return associatedObjects["animationDotFromValueKey"] as? CGFloat ?? 1.0 }
    }
    
    open var animationDotToValue: CGFloat {
        set { associatedObjects["animationDotToValueKey"] = newValue }
        get { return associatedObjects["animationDotToValueKey"] as? CGFloat ?? 0.5 }
    }
    
    open var animationDotDuraction: Double {
        set { associatedObjects["animationDotDuractionKey"] = newValue }
        get { return associatedObjects["animationDotDuractionKey"] as? Double ?? 1.5 }
    }
    
    var animationDotPaddingX: CGFloat {
        return 5
    }
    
    var animationDotSize: CGFloat {
        return 10
    }
    
    var animationDotCornarRadius: CGFloat {
        return animationDotSize / 2
    }
    
    var animationDotCount: Int {
        return 3
    }
    
    var animationDotAllSize: CGFloat {
        return (animationDotSize + animationDotPaddingX) * CGFloat(animationDotCount)
    }
    
    var canAnimation: Bool {
        return getLabelTextPointMinX > animationDotAllSize
    }
    
    var getLabelTestWidth: CGFloat {
        guard let text = titleLabel?.text else { return 0 }
        guard let font = titleLabel?.font else { return 0 }
        let nsText = NSString(string: text)
        let rect = nsText.boundingRect(with: .zero, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return rect.width
    }
    
    var getLabelTextPointMinX: CGFloat {
        return (frame.width - getLabelTestWidth) / 2
    }
    
    var animationDotPointX: CGFloat {
        return getLabelTextPointMinX - animationDotAllSize
    }
    
    var animationDotPointY: CGFloat {
        return (frame.height - animationDotSize) / 2
    }
    
    var animationDotTranslationX: CGFloat {
        return animationDotSize + animationDotPaddingX
    }
    
    var animationInstanceDelay: Double {
        return animationDotDuraction / Double(animationDotCount)
    }
    
    open func startAnimation() {
        stopAnimation()
        guard canAnimation else { setIndactorAnimation(); return }
        setDotAnimation()
    }
    
    func setDotAnimation() {
        let lay = CAReplicatorLayer()
        lay.frame = bounds
        let bar = CALayer()
        bar.frame = CGRect(x: animationDotPointX, y: animationDotPointY, width: animationDotSize, height: animationDotSize)
        bar.cornerRadius = animationDotCornarRadius
        bar.backgroundColor = animationLoadingObjectColor.cgColor
        lay.addSublayer(bar)
        lay.instanceCount = animationDotCount
        lay.instanceTransform = CATransform3DMakeTranslation(animationDotTranslationX, 0, 0)
        let anim = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        anim.fromValue = animationDotFromValue
        anim.toValue = animationDotToValue
        anim.duration = animationDotDuraction
        anim.repeatCount = .infinity
        bar.add(anim, forKey: nil)
        lay.instanceDelay = animationInstanceDelay
        layer.addSublayer(lay)
        animationLayer = lay
    }
    
    var indactorSize: CGFloat {
        let width = frame.width / 3
        let height = frame.height / 2
        return width > height ? width : height
    }
    
    var indactorCenterPointX: CGFloat {
        return frame.width / 2
    }
    
    var indactorCenterPointY: CGFloat {
        return frame.height / 2
    }
    
    var indactorCenterPoint: CGPoint {
        return CGPoint(x: indactorCenterPointX, y: indactorCenterPointY)
    }
    
    func setIndactorAnimation() {
        setNotificationIndactorAnimation()
        let animationIndactorView = RecoadButtonActivityIndactorView(frame: CGRect(x: 0, y: 0, width: indactorSize, height: indactorSize))
        animationIndactorView.center = indactorCenterPoint
        animationIndactorView.color = animationLoadingObjectColor
        addSubview(animationIndactorView)
        animationIndactorView.startAnimating()
        self.animationIndactor = animationIndactorView
    }
    
    func setNotificationIndactorAnimation() {
        NotificationCenter.default.addObserver(self, selector: #selector(touchActivityIndactor(notification:)), name: .TouchActivityIndacotrViewNotification, object: nil)
    }
    
    @objc func touchActivityIndactor(notification: NSNotification) {
        stopAnimation()
    }
    
    open func stopAnimation() {
        NotificationCenter.default.removeObserver(self)
        animationIndactor?.stopAnimating()
        animationIndactor?.removeFromSuperview()
        animationLayer?.removeAllAnimations()
        animationLayer?.removeFromSuperlayer()
    }
    
    open override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        guard newSuperview == nil else { return }
        stopAnimation()
    }
}
