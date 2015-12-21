//
//  Cans.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 11/11/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import SpriteKit

class Cans : SKNode {
    
    var canned :SKSpriteNode!
    var cannedShoot : [SKTexture]!


    override init() {
        super.init()
        name = "Cans\(self)"
        
              //addcanned
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addcans),
                SKAction.waitForDuration(12)
                ])
            ))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
    func addcans(){
        let cannedAnimatedAtlas : SKTextureAtlas = SKTextureAtlas(named: "canneds")
        var runningFrames = [SKTexture]()
        let numImages : Int = cannedAnimatedAtlas.textureNames.count
        
        for var i=1; i<=numImages; i++ {
            let cannedTextureName = "canned\(i)"
            //print(cannedTextureName)
            runningFrames.append(cannedAnimatedAtlas.textureNamed(cannedTextureName))
        }
        
        cannedShoot = runningFrames
        
        //Create bear sprite, setup position in middle of the screen, and add to Scene
        let temp : SKTexture = cannedShoot[0]
        canned = SKSpriteNode(texture: temp)
        canned.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(cannedShoot, timePerFrame: 0.20, resize: false, restore: true)))
        
        canned.size.width = 35
        canned.size.height = 45
        
        
        //position
        canned.position = CGPoint(x: 100, y: canned.size.height * random(min: 2, max: 2.3))
        addChild(canned)
        
        let movecanned = (SKAction.moveByX(-800, y: 0.0,duration: NSTimeInterval(random(min: 7, max: 9))))
        let removecanned = (SKAction.removeFromParent())
        
        canned.runAction(SKAction.sequence([movecanned, removecanned]))
        
        canned.physicsBody = SKPhysicsBody(rectangleOfSize: canned.self.size)
        canned.physicsBody?.dynamic = true
        canned.physicsBody?.affectedByGravity = false
        canned.physicsBody?.allowsRotation = false
        canned.physicsBody?.categoryBitMask = CansCategory
        canned.physicsBody?.contactTestBitMask = CansCategory 
        canned.physicsBody?.collisionBitMask = 0
    }

    
}