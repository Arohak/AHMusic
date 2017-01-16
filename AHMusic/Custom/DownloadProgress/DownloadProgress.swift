//
//  DownloadProgress.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/27/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//
 class ShapeLayer: CAShapeLayer {
    
    var gradientMaskLayer: CAGradientLayer!
    
    init(center: CGFloat) {
        super.init()
        
        createProgressLayer(center)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createProgressLayer(_ center: CGFloat) {
        let startAngle = CGFloat(M_PI_2)
        let endAngle = CGFloat(M_PI * 2 + M_PI_2)
        let centerPoint = CGPoint(x: center/2, y: center/2)
        
        gradientMaskLayer = gradientMask()
        
        self.path = UIBezierPath(arcCenter:centerPoint, radius: center/3, startAngle:startAngle, endAngle:endAngle, clockwise: true).cgPath
        self.backgroundColor = CLEAR.cgColor
        self.fillColor = nil
        self.strokeColor = BLACK.cgColor
        self.lineWidth = DeviceType.IS_IPAD ? 3.5 : 3
        self.strokeStart = 0.0
        self.strokeEnd = 0.0
        
        gradientMaskLayer.mask = self
    }
    
    func gradientMask() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        gradientLayer.locations = [0.0, 1.0]
        
        let colorTop: AnyObject = WHITE.cgColor
        let colorBottom: AnyObject = WHITE.cgColor
        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    func hideProgressView() {
        self.strokeEnd = 0.0
        self.removeAllAnimations()
    }
    
    func animateProgressView(_ fromV: Float, toV: Float, dur: CFTimeInterval) {
        self.strokeEnd = 0.0
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(fromV)
        animation.toValue = CGFloat(toV)
        animation.duration = dur
//        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = kCAFillModeForwards
        self.add(animation, forKey: "strokeEnd")
    }
}
