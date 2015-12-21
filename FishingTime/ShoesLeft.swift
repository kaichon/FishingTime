//
//  Shoes.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 11/11/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import SpriteKit

class ShoesLeft : SKNode {
    
    var shoe :SKSpriteNode!
    var shoeShoot : [SKTexture]!
    
    
    override init() {
        super.init()
        
        
        //addshoe
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addshoe),
                SKAction.waitForDuration(8) // เวลาในการสุ่มปลาออกมา...หน่วยเป็นวินาที
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
    
    
    func addshoe(){
        
        let shoeAnimatedAtlas : SKTextureAtlas = SKTextureAtlas(named: "shoe")
        var runningFrames = [SKTexture]()
        let numImages : Int = shoeAnimatedAtlas.textureNames.count
        
        for var i=1; i<=numImages; i++ {
            let cannedTextureName = "shoe\(i)"
            //print(cannedTextureName)
            runningFrames.append(shoeAnimatedAtlas.textureNamed(cannedTextureName))
        }
        
        shoeShoot = runningFrames
        
        //Create bear sprite, setup position in middle of the screen, and add to Scene
        let temp : SKTexture = shoeShoot[0]
        shoe = SKSpriteNode(texture: temp)
        shoe.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(shoeShoot, timePerFrame: 0.40, resize: false, restore: true)))
        
        shoe.size.width = 50
        shoe.size.height = 35
        
        
        
        //position
        shoe.position = CGPoint(x: frame.size.width + shoe.size.width/2, y: shoe.size.height * random(min: -0.2, max: 2.2))
        addChild(shoe)
        
        let moveshoe = (SKAction.moveByX(600, y: 0.0,duration: NSTimeInterval(random(min: 6, max: 8))))
        let removeshoe = (SKAction.removeFromParent())
        
        shoe.runAction(SKAction.sequence([moveshoe, removeshoe]))
        
        //
        shoe.physicsBody = SKPhysicsBody(rectangleOfSize: shoe.self.size)
        shoe.physicsBody?.dynamic = true
        shoe.physicsBody?.affectedByGravity = false
        shoe.physicsBody?.allowsRotation = false
        shoe.physicsBody?.categoryBitMask = ShoesCategory
        shoe.physicsBody?.contactTestBitMask = ShoesCategory
        shoe.physicsBody?.collisionBitMask = 0
    }
    
    
}