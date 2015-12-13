//
//  LevelOne.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 20/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


@available(iOS 9.0, *)
class Speed: SKScene , SKPhysicsContactDelegate{
      
    private var fish1 = Fish1()
    private var fish2 = Fish2()
    private var shoes = Shoes()
    private var cans = Cans()
    
    var timeOut = SKLabelNode(text: "0")
    var seconds = 0
    var timer = NSTimer()
    let bg = SKSpriteNode(imageNamed: "BGSpeed")
    
    var points = SKLabelNode(text: "0")
    let btnclose = SKSpriteNode(imageNamed: "close")
    
    let man = Man()
    let hook = Control()
    let rope = Rope()
    var a:UInt!
    
    func ab(){
    }
    func ac(){
    }
    override func didMoveToView(view: SKView)  {
        
        setupGame()
        print( "helloy")
        
        
        bg.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bg.size.width = 1136/2
        bg.size.height = 640/2
        addChild(bg)
        
        // ตำแหน่งการแสดงคะแนน ในหน้าจอ ------------------------------------------------------
        points.position = CGPoint(x: frame.size.width * 0.89, y: frame.size.height * 0.9)
        points.fontColor = UIColor.redColor()
        points.fontSize = 30
        points.fontName = "Courier"
        addChild(points)
   
        
        //-----------------------------------------------------------------------------------
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.97, self.size.height * 0.94)
        btnclose.size = CGSizeMake(34,35)
        addChild(btnclose)
        
        
        
        timeOut.fontSize = 20
        timeOut.fontName = "Courier"
        timeOut.fontColor = UIColor.blackColor()
        timeOut.position = CGPoint(x: frame.size.width * 0.05, y: frame.size.height * 0.86 )
        addChild(timeOut)
        
                // --------- คนตกปลา เบ็ด------------------
        man.position = CGPointMake(self.size.width * 0.26 , self.size.height * 0.7)
        addChild(man)
        
        hook.position = CGPointMake(self.size.width * 0.52 , self.size.height * 0.93)
        //hook.size = CGSizeMake(18,18)
        addChild(hook)

        rope.position = CGPointMake(self.size.width * 0.52 , self.size.height * 1.42)
//        rope.size = CGSizeMake(2,301)
        addChild(rope)
        
        
        
        
        //  All Enemy ----------------------------
        
        fish1.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish1)
        
        fish2.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish2)
        
        
        shoes.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(shoes)
        
        cans.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(cans)
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        
        
    }
    
    
    func setupGame()  {
        seconds = 20
        timeOut.text = "\(seconds)" //แสดงค่าเริ่มต้น
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
    }
    
    func subtractTime() {
        seconds--
        timeOut.text = "\(seconds)"  //แสดงตอนเวลานับถอยหลัง
        
        if(seconds <= 0)  {
            timer.invalidate()
            
            let ScoreSpeedScene = ScoreSpeed(size: self.size)
            let transition = SKTransition.fadeWithDuration(0)
            self.scene!.view?.presentScene(ScoreSpeedScene, transition: transition)
        }
        
    }
    
    func controlHook(){
        let movwDown = (SKAction.moveToY(10, duration: 3.0))
        let moveUp = (SKAction.moveToY(296, duration: 4.0))
        
        let ropeDown = (SKAction.moveToY(170, duration: 3.0))
        let ropeUp = (SKAction.moveToY(455, duration: 4.0))
        
        hook.runAction(SKAction.sequence([movwDown, moveUp]))
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
    
    func collition() {
        print("Hit")
        //projectile.removeFromParent()
        fish1.removeFromParent()
    }
    override func update(currentTime: CFTimeInterval) {
    
   
    }
    
    
    
    
  
 }
