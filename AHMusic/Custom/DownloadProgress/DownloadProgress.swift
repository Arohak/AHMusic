//
//  DownloadProgress.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/27/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//class DownloadProgress: UIView {
//
//    //MARK: - Private Methods
//    private func createProgressLayer() {
//        let startAngle = CGFloat(M_PI_2)
//        let endAngle = CGFloat(M_PI * 2 + M_PI_2)
//        let centerPoint = CGPointMake(FIC_ICON_SIZE/2, FIC_ICON_SIZE/2)
//        
//        let gradientMaskLayer = gradientMask()
//        progressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: FIC_ICON_SIZE/2.5, startAngle:startAngle, endAngle:endAngle, clockwise: true).CGPath
//        progressLayer.backgroundColor = UIColor.clearColor().CGColor
//        progressLayer.fillColor = nil
//        progressLayer.strokeColor = UIColor.blackColor().CGColor
//        progressLayer.lineWidth = DeviceType.IS_IPAD ? 3.5 : 2
//        progressLayer.strokeStart = 0.0
//        progressLayer.strokeEnd = 0.0
//        
//        gradientMaskLayer.mask = progressLayer
//        self.downloadButton.layer.addSublayer(gradientMaskLayer)
//    }
//    
//    private func gradientMask() -> CAGradientLayer {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        
//        gradientLayer.locations = [0.0, 1.0]
//        
//        let colorTop: AnyObject = BLUE.CGColor
//        let colorBottom: AnyObject = BLUE.CGColor
//        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
//        gradientLayer.colors = arrayOfColors
//        
//        return gradientLayer
//    }
//    
//    //MARK: - Public Methods
//    func hideProgressView() {
//        self.progressLayer.strokeEnd = 0.0
//        self.progressLayer.removeAllAnimations()
//    }
//    
//    func animateProgressView(fromV: Float, toV: Float, dur: CFTimeInterval) {
//        self.progressLayer.strokeEnd = 0.0
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.fromValue = CGFloat(fromV)
//        animation.toValue = CGFloat(toV)
//        animation.duration = dur
//        animation.delegate = self
//        animation.removedOnCompletion = false
//        animation.additive = true
//        animation.fillMode = kCAFillModeForwards
//        self.progressLayer.addAnimation(animation, forKey: "strokeEnd")
//    }
//}
