//
//  Enemy.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 23/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import SpriteKit

public class Enemy: SKNode {
    
    var fish : SKSpriteNode!
    var fishShoot : [SKTexture]!

    var chon : SKSpriteNode!
    var chonShoot : [SKTexture]!
    
    var canned :SKSpriteNode!
    var cannedShoot : [SKTexture]!
    
    var shoe :SKSpriteNode!
    var shoeShoot : [SKTexture]!
    
    override init() {
        super.init()
        name = "Enemy\(self)"
        
        //addFish
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addFish),
                SKAction.waitForDuration(5) // เวลาในการสุ่มปลาออกมา...หน่วยเป็นวินาที
                ])
            ))
        
        //addChon
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addChon),
                SKAction.waitForDuration(9) // เวลาในการสุ่มปลาออกมา...หน่วยเป็นวินาที
                ])
            ))
        
        //addcanned
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addcanned),
                SKAction.waitForDuration(15) // เวลาในการสุ่มปลาออกมา...หน่วยเป็นวินาที
                ])
            ))
        
        //addshoe
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addshoe),
                SKAction.waitForDuration(18) // เวลาในการสุ่มปลาออกมา...หน่วยเป็นวินาที
                ])
            ))
        
        
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func PhysicsBody() {
        let body = SKPhysicsBody(rectangleOfSize: CGSizeMake(40, 40))
        body.affectedByGravity = false
        body.categoryBitMask = HookCategory
        body.contactTestBitMask = Fish1Category
        body.mass = 0.2
        body.angularDamping = 0
        body.linearDamping = 0
        physicsBody = body
    }
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addFish(){
        
        let fishAnimatedAtlas : SKTextureAtlas = SKTextureAtlas(named: "fish")
        var runningFrames = [SKTexture]()
        let numImages : Int = fishAnimatedAtlas.textureNames.count
        
        for var i=1; i<=numImages; i++ {
            let fishTextureName = "fish\(i)"
            print(fishTextureName)
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
        fish.position = CGPoint(x: frame.size.width + fish.size.width/2, y: fish.size.height * random(min: -0.2, max: 2.2))
        addChild(fish)
        
        fish.runAction(
            SKAction.moveByX(-700 , y: 0.0,
                duration: NSTimeInterval(random(min: 6, max: 8))))
        
    }
    func addChon() {
        //การสร้างมอนส์เตอร์(ชื่อไฟล์รูปภาพ)มาเก็บไว้ในตัวแปร
        let chonAnimatedAtlas : SKTextureAtlas = SKTextureAtlas(named: "chon")
        var runningFrames = [SKTexture]()
        let numImages : Int = chonAnimatedAtlas.textureNames.count
        
        
        for var i=1; i<=numImages; i++ {
            let chonTextureName = "chon\(i)"
            print(chonTextureName)
            runningFrames.append(chonAnimatedAtlas.textureNamed(chonTextureName))
        }
        
        chonShoot = runningFrames
        
        let temp : SKTexture = chonShoot[0]
        chon = SKSpriteNode(texture: temp)
        
        chon.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(chonShoot, timePerFrame: 0.07, resize: false, restore: true)))
        
        chon.size.width = 80
        chon.size.height = 33
        
        
        
        chon.position = CGPoint(x: frame.size.width + chon.size.width/2, y: chon.size.height * random(min: -0.2, max: 2.2))
        addChild(chon)
        
        chon.runAction(
            SKAction.moveByX(-700, y: 0.0,
                duration: NSTimeInterval(random(min: 4, max: 5))))
        
        
        
    }
    func addcanned(){
        let cannedAnimatedAtlas : SKTextureAtlas = SKTextureAtlas(named: "canneds")
        var runningFrames = [SKTexture]()
        let numImages : Int = cannedAnimatedAtlas.textureNames.count
        
        for var i=1; i<=numImages; i++ {
            let cannedTextureName = "canned\(i)"
            print(cannedTextureName)
            runningFrames.append(cannedAnimatedAtlas.textureNamed(cannedTextureName))
        }
        
        cannedShoot = runningFrames
        
        //Create bear sprite, setup position in middle of the screen, and add to Scene
        let temp : SKTexture = cannedShoot[0]
        canned = SKSpriteNode(texture: temp)
        canned.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(cannedShoot, timePerFrame: 0.20, resize: false, restore: true)))
        
        canned.size.width = 30
        canned.size.height = 40
        
        
        //position
        canned.position = CGPoint(x: frame.size.width + canned.size.width/2, y: canned.size.height * random(min: -0.2, max: 2))
        addChild(canned)
        
        canned.runAction(
            SKAction.moveByX(-700, y: 0.0,
                duration: NSTimeInterval(random(min: 7, max: 9))))
        
        
    }
    func addshoe(){
        let shoeAnimatedAtlas : SKTextureAtlas = SKTextureAtlas(named: "shoe")
        var runningFrames = [SKTexture]()
        let numImages : Int = shoeAnimatedAtlas.textureNames.count
        
        for var i=1; i<=numImages; i++ {
            let cannedTextureName = "shoe\(i)"
            print(cannedTextureName)
            runningFrames.append(shoeAnimatedAtlas.textureNamed(cannedTextureName))
        }
        
        shoeShoot = runningFrames
        
        //Create bear sprite, setup position in middle of the screen, and add to Scene
        let temp : SKTexture = shoeShoot[0]
        shoe = SKSpriteNode(texture: temp)
        shoe.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(shoeShoot, timePerFrame: 0.40, resize: false, restore: true)))
        
        shoe.size.width = 45
        shoe.size.height = 30
        
        
        
        //position
        shoe.position = CGPoint(x: frame.size.width + shoe.size.width/2, y: shoe.size.height * random(min: -0.2, max: 2.2))
        addChild(shoe)
        
        shoe.runAction(
            SKAction.moveByX(-700, y: 0.0,
                duration: NSTimeInterval(random(min: 6, max: 8))))
        
    }
    

    

    
    
}
