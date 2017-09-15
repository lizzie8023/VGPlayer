//
//  VGPlayerSlider.swift
//  Pods
//
//  Created by Vein on 2017/6/4.
//
// https://developer.apple.com/reference/uikit/uislider

import UIKit

open class VGPlayerSlider: UISlider {
    
    open var progressView : UIProgressView
    
    public override init(frame: CGRect) {
        self.progressView = UIProgressView()
        super.init(frame: frame)
        configureSlider()
        
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 设置滑块可触摸范围的大小
    override open func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let rect = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        let newRect = CGRect(x: rect.origin.x, y: rect.origin.y + 1, width: rect.width, height: rect.height)
        return newRect
    }
    
    /// 修改进度条尺寸
    override open func trackRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.trackRect(forBounds: bounds)
        let newRect = CGRect(origin: rect.origin, size: CGSize(width: rect.size.width, height: 2.0))
        configureProgressView(newRect)
        return newRect
    }
    
    /// 设置进度条划过的和未划过的图片的尺寸设置进度条划过的和未划过的图片的尺寸
    func configureSlider() {
        self.maximumValue = 1.0
        self.minimumValue = 0.0
        self.value = 0.0
        self.maximumTrackTintColor = UIColor.clear
        self.minimumTrackTintColor = UIColor.white
        
        let thumbImage = VGPlayerUtils.imageResource("VGPlayer_ic_slider_thumb")
        let normalThumbImage = VGPlayerUtils.imageSize(image: thumbImage!, scaledToSize: CGSize(width: 15, height: 15))
        self.setThumbImage(normalThumbImage, for: .normal)
        let highlightedThumbImage = VGPlayerUtils.imageSize(image: thumbImage!, scaledToSize: CGSize(width: 20, height: 20))
        self.setThumbImage(highlightedThumbImage, for: .highlighted)
        
        self.backgroundColor = UIColor.clear
        self.progressView.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7988548801)
        self.progressView.trackTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2964201627)
    }
    
    func configureProgressView(_ frame: CGRect) {
        progressView.frame = frame
        insertSubview(progressView, at: 0)
    }
    
    open func setProgress(_ progress: Float, animated: Bool) {
        progressView.setProgress(progress, animated: animated)
    }
    
}
