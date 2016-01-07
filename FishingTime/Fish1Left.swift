//
//  Fish1.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 11/11/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//


import Foundation
import SpriteKit
import GameplayKit

class Fish1Left : SKNode {
    
    private var fish : SKSpriteNode!
    var fishShoot : [SKTexture]!
    
    
    
    override init() {
        super.init()
      
        
        
        //addFish
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addFish),
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
    
    
    
    func addFish(){
        
        let fishAnimatedAtlas : SKTextureAtlas = SKTextureAtlas(named: "fish1left")
        var runningFrames = [SKTexture]()
        let numImages : Int = fishAnimatedAtlas.textureNames.count
        
        for var i=1; i<=numImages; i++ {
            let fishTextureName = "fish\(i)"
            //            print(fishTextureName)
            runningFrames.append(fishAnimatedAtlas.textureNamed(fishTextureName))
        }
        
        fishShoot = runningFrames
        
        //Create bear sprite, setup position in middle of the screen, and add to Scene
        let temp : SKTexture = fishShoot[0]
        fish = SKSpriteNode(texture: temp)
        fish.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(fishShoot, timePerFrame: 0.14, resize: false, restore: true)))
        
        fish.size.width = 60
        fish.size.height = 35
        
        
        //position
        fish.position = CGPoint(x: frame.size.width + fish.size.width/2, y: fish.size.height * random(min: -0.2, max: 2.0))
        addChild(fish)
        
        let movefish = (SKAction.moveByX(800, y: 0.0,duration: NSTimeInterval(random(min: 8, max: 10))))
        let removefish = (SKAction.removeFromParent())
        
        
        fish.runAction(SKAction.sequence([movefish, removefish]))
        
        
        
        fish.physicsBody = SKPhysicsBody(rectangleOfSize: fish.size)
        fish.physicsBody?.dynamic = true
        fish.physicsBody?.affectedByGravity = false
        fish.physicsBody?.allowsRotation = false
        fish.physicsBody?.categoryBitMask = Fish1LeftCategory
        fish.physicsBody?.contactTestBitMask = HookCategory
        fish.physicsBody?.collisionBitMask = 0
        
        
        
        
        
        
    }
    
    
    
}