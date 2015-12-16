//
//  Fiah2.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 11/11/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import SpriteKit
import GameplayKit



class Fish2 : SKNode {

    var chon : SKSpriteNode!
    var chonShoot : [SKTexture]!


    
    override init() {
        super.init()
        name = "Enemy\(self)"
        
        
        //addChon
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addChon),
                SKAction.waitForDuration(9) // เวลาในการสุ่มปลาออกมา...หน่วยเป็นวินาที
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
    

    func addChon() {
        //การสร้างมอนส์เตอร์(ชื่อไฟล์รูปภาพ)มาเก็บไว้ในตัวแปร
        let chonAnimatedAtlas : SKTextureAtlas = SKTextureAtlas(named: "chon")
        var runningFrames = [SKTexture]()
        let numImages : Int = chonAnimatedAtlas.textureNames.count
        
        
        for var i=1; i<=numImages; i++ {
            let chonTextureName = "chon\(i)"
            //print(chonTextureName)
            runningFrames.append(chonAnimatedAtlas.textureNamed(chonTextureName))
        }
        
        chonShoot = runningFrames
        
        let temp : SKTexture = chonShoot[0]
        chon = SKSpriteNode(texture: temp)
        
        chon.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(chonShoot, timePerFrame: 0.07, resize: false, restore: true)))
        
        chon.size.width = 80
        chon.size.height = 33
        
        
        chon.physicsBody = SKPhysicsBody(rectangleOfSize: chon.size) // 1
        chon.physicsBody?.dynamic = true // 2
        chon.physicsBody?.affectedByGravity = false
        chon.physicsBody?.allowsRotation = false
        chon.physicsBody?.categoryBitMask = Fish2Category // 3
        chon.physicsBody?.contactTestBitMask = Fish2Category 
        chon.physicsBody?.collisionBitMask = 10 
        
         let actualY = chon.size.height * random(min:  -0.2 , max: 2.2)
        
        chon.position = CGPoint(x: frame.size.width + chon.size.width/2, y:  actualY)
        addChild(chon)
        
        
        //let chonn = SKAction.moveByX(-500, y: 0.0,duration: NSTimeInterval(random(min: 4, max: 5)))

        
        //chon.runAction(SKAction.moveByX(-800, y: 0.0,duration: NSTimeInterval(random(min: 4, max: 5))))
        
        
        //let chonn = SKAction.moveTo(CGPoint(x: -chon.size.width*15, y: actualY), duration: NSTimeInterval(random(min: 4, max: 5)))
        
        let movefish = (SKAction.moveByX(-800, y: 0.0,duration: NSTimeInterval(random(min: 4, max: 5))))
        let removefish = (SKAction.removeFromParent())
        
        chon.runAction(SKAction.sequence([movefish, removefish]))
    }

    
    
}


