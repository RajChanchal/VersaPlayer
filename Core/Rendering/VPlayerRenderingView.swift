//
//  VPlayerRenderingView.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/11/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import UIKit
import AVKit

open class VPlayerRenderingView: UIView {
    
    public var renderingLayer: VPlayerLayer!
    public var player: VersaPlayer!
    
    public init(with player: VersaPlayer) {
        super.init(frame: CGRect.zero)
        self.player = player
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        if renderingLayer == nil {
            renderingLayer = VPlayerLayer.init(with: player)
            layer.addSublayer(renderingLayer.playerLayer)
        }
        
        renderingLayer.playerLayer.frame = bounds
    }

}
