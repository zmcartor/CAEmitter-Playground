// Playground - noun: a place where people can play

import UIKit
import QuartzCore

class Emitter : UIView {
    override class func layerClass() -> AnyClass! {
        return CAEmitterLayer().classForCoder
    }
}

class ParticleViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("loaded!")
        self.view = Emitter(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        
        let layer = self.view.layer as CAEmitterLayer
        layer.emitterShape = kCAEmitterLayerPoint
        layer.renderMode = kCAEmitterLayerOldestFirst
        layer.emitterPosition = CGPointMake(200,200)
        
        let fireCell = CAEmitterCell()
        fireCell.contents = UIImage(named: "pink.png").CGImage
        fireCell.contentsRect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        fireCell.birthRate = 13.0
        fireCell.lifetime = 5
        fireCell.velocity = 40
        fireCell.velocityRange = 10
        fireCell.scale = 1
        fireCell.scaleRange = 0.5
        fireCell.scaleSpeed = 0.2
        fireCell.alphaRange = 0.2
        fireCell.alphaSpeed = -0.2
        fireCell.color = UIColor.redColor().CGColor
        layer.emitterCells = [fireCell]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("appeared!!!")
    }
}

let controller = ParticleViewController()
controller.viewDidLoad()
controller.view




