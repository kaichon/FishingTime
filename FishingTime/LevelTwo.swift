//
//  LevelOne.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 20/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import SpriteKit
import AVFoundation
import GameplayKit
@available(iOS 9.0, *)
class LevelTwo: SKScene , SKPhysicsContactDelegate{
    
    
    private var fish1 = Fish1()
    private var fish2 = Fish2()
    private var shoes = Shoes()
    private var cans = Cans()
    

    var timeOut = SKLabelNode(text: "0")
    var seconds = 0
    var timer = NSTimer()
    let bg = SKSpriteNode(imageNamed: "BGLavel2")
    var level = SKLabelNode(text: "level 2")
    
    var points1 = SKLabelNode(text: "0")
    var points2 = SKLabelNode(text: "0")
    var numPoints1 = 0
    var numPoints2 = 0
    
    let fullscore = SKLabelNode(text: "/3")
    let fullscore2 = SKLabelNode(text: "/2")

    let btnclose = SKSpriteNode(imageNamed: "close")
    
    let man = SKSpriteNode(imageNamed: "man")
    let hook = Control()
    let rope = SKSpriteNode(imageNamed: "rope")

    

    override func didMoveToView(view: SKView)  {
        
        bg.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bg.size.width = frame.size.width
        bg.size.height = frame.size.height
        addChild(bg)
        
        
        // ตำแหน่งการแสดงคะแนน ในหน้าจอ ------------------------------------------------------
        points1.position = CGPoint(x: frame.size.width * 0.88, y: frame.size.height * 0.93)
        points1.fontColor = UIColor.redColor()
        points1.fontSize = 20
        points1.fontName = "Courier"
        addChild(points1)
        
        fullscore.position = CGPoint(x: frame.size.width * 0.91, y: frame.size.height * 0.93)
        fullscore.fontColor = UIColor.redColor()
        fullscore.fontSize = 20
        fullscore.fontName = "Courier"
        addChild(fullscore)
        
        // ตำแหน่งการแสดงคะแนน ในหน้าจอ
        points2.position = CGPoint(x: frame.size.width * 0.88, y: frame.size.height * 0.85)
        points2.fontColor = UIColor.redColor()
        points2.fontSize = 20
        points2.fontName = "Courier"
        addChild(points2)
        
        
        fullscore2.position = CGPoint(x: frame.size.width * 0.91, y: frame.size.height * 0.85)
        fullscore2.fontColor = UIColor.redColor()
        fullscore2.fontSize = 20
        fullscore2.fontName = "Courier"
        addChild(fullscore2)
        
        //-----------------------------------------------------------------------------------
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.97, self.size.height * 0.94)
        btnclose.size.width = size.width / 20
        btnclose.size.height = size.height / 12.5
        addChild(btnclose)
 
        
        level.position = CGPointMake(self.size.width / 2, self.size.height/2)
        level.fontSize = 30
        level.fontColor = UIColor.redColor()
        addChild(level)
        
        
        setupGame()
        backgroundColor = SKColor.whiteColor()
        
        
        timeOut.fontSize = 20
        timeOut.fontName = "Courier"
        timeOut.fontColor = UIColor.blackColor()
        timeOut.position = CGPoint(x: frame.size.width * 0.05, y: frame.size.height * 0.86 )
        addChild(timeOut)
        
        //  All Enemy ----------------------------
        
        fish1.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish1)
        
        fish2.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish2)
        
        
        shoes.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(shoes)
        
        cans.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(cans)

        
        // --------- คนตกปลา เบ็ด------------------
        man.position = CGPointMake(self.size.width * 0.26 , self.size.height * 0.69)
        man.size.width = size.width/1.9
        man.size.height = size.height/1.6
        addChild(man)
        
        rope.position = CGPointMake(self.size.width * 0.52 , self.size.height * 1.42)
        rope.size.width = size.width / 200
        rope.size.height = size.height
        addChild(rope)
        
        hook.position = CGPointMake(self.size.width * 0.52 , self.size.height * 0.9)
        addChild(hook)
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self

    }
    
    func setupGame()  {
        seconds = 120
        timeOut.text = "\(seconds)" //แสดงค่าเริ่มต้น
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
        
    }
    
    func subtractTime() {
        seconds--
        timeOut.text = "\(seconds)"  //แสดงตอนเวลานับถอยหลัง
        
        if(seconds <= 0)  {
            timer.invalidate()
            let Scene = ScoreLevel2(size: self.size)
            let transition = SKTransition.fadeWithDuration(0)
            self.scene!.view?.presentScene(Scene, transition: transition)

        }else if(seconds <= 115)  {
            level.removeFromParent()
        }

    }
    func controlHook(){
        let hookmovwDown = (SKAction.moveToY(self.frame.size.height * 0.02, duration: 3.0))
        let hookmoveUp = (SKAction.moveToY(self.frame.size.height * 0.9, duration: 2.0))
        
        let ropeDown = (SKAction.moveToY(self.frame.size.height * 0.54, duration: 3.0))
        let ropeUp = (SKAction.moveToY(self.frame.size.height * 1.42, duration: 2.0))
        
        hook.runAction(SKAction.sequence([hookmovwDown, hookmoveUp]))
        rope.runAction(SKAction.sequence([ropeDown, ropeUp]))
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            controlHook()
            
            if btnclose.containsPoint(location){
                let playScene = Play(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
            }
        }
    }
    func didBeginContact(contact: SKPhysicsContact) {
        let a: SKPhysicsBody //= contact.bodyA
        let b: SKPhysicsBody //= contact.bodyB
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
            a = contact.bodyA
            b = contact.bodyB
        }else{
            a = contact.bodyB
            b = contact.bodyA
        }
        
        print("a:",a.categoryBitMask,"b:",b.categoryBitMask)
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == Fish1Category){
            print("Fish1")
            numPoints1 += 1
            points1.text = "\(numPoints1)"
            fish1.removeAllChildren()
            
            
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == Fish2Category){
            print("Fish2")
            numPoints2 += 1
            points2.text = "\(numPoints2)"
            fish2.removeAllChildren()
        }
        
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == ShoesCategory){
            print("Shoes")
            seconds -= 10
            shoes.removeAllChildren()
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == CansCategory){
            print("Can")
            seconds -= 10
            cans.removeAllChildren()
        }
        
    }

    
    
}