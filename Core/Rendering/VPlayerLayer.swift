//
//  VPlayerLayer.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/11/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import AVFoundation
import AVKit

open class VPlayerLayer: CALayer {
    
    public var playerLayer: AVPlayerLayer!
    public var handler: VersaPlayer!
    
    override public init(layer: Any) {
        super.init(layer: layer)
    }
    
    override public init() {
        super.init()
    }
    
    public convenience init(with player: VersaPlayer) {
        self.init()
        playerLayer = AVPlayerLayer.init(player: player.player)
        let controller = AVPictureInPictureController(playerLayer: playerLayer)
        controller?.delegate = player
        player.pipController = controller
        addSublayer(playerLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSublayers() {
        super.layoutSublayers()
        playerLayer.frame = bounds
    }
    
}
