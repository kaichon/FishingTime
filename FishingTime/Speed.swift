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
    let btnclose = SKSpriteNode(imageNamed: "close")
    
    
    var points = SKLabelNode(text: "0")
    var numPoints = 0
    

    let man = SKSpriteNode(imageNamed: "man")
    let rope = SKSpriteNode(imageNamed: "rope")
    let hook = Control()
    
    override func didMoveToView(view: SKView)  {
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        setupGame()
        
        bg.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bg.size.width = frame.size.width
        bg.size.height = frame.size.height
        addChild(bg)
        print(bg.frame)
        
        // ตำแหน่งการแสดงคะแนน ในหน้าจอ ------------------------------------------------------
        points.position = CGPoint(x: frame.size.width * 0.89, y: frame.size.height * 0.9)
        points.fontColor = UIColor.redColor()
        points.fontSize = 30
        points.fontName = "Courier"
        addChild(points)
   
        
        //-----------------------------------------------------------------------------------
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.97, self.size.height * 0.94)
        btnclose.size.width = size.width / 20
        btnclose.size.height = size.height / 12.5
        addChild(btnclose)        
        
        
        timeOut.fontSize = 20
        timeOut.fontName = "Courier"
        timeOut.fontColor = UIColor.blackColor()
        timeOut.position = CGPoint(x: frame.size.width * 0.05, y: frame.size.height * 0.86 )
        addChild(timeOut)
        
                // --------- คนตกปลา เบ็ด------------------
        man.position = CGPointMake(self.size.width * 0.26 , self.size.height * 0.69)
        man.size.width = size.width / 1.9
        man.size.height = size.height / 1.6
        addChild(man)
        
        rope.position = CGPointMake(self.size.width * 0.52 , self.size.height * 1.42)
        rope.size.width = size.width / 200
        rope.size.height = size.height
        addChild(rope)
        
        hook.position = CGPointMake(self.size.width * 0.52 , self.size.height * 0.9)
        addChild(hook)
        
        //  All Enemy ----------------------------
        
        fish1.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish1)
        
        fish2.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish2)
        
        
        shoes.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(shoes)
        
        cans.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(cans)
        
        
        

    }
    
    
    func setupGame()  {
        seconds = 70
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
        let hookmovwDown = (SKAction.moveToY(self.frame.size.height * 0.02, duration: 3.0))
        let hookmoveUp = (SKAction.moveToY(self.frame.size.height * 0.9, duration: 4.0))
        
        let ropeDown = (SKAction.moveToY(self.frame.size.height * 0.54, duration: 3.0))
        let ropeUp = (SKAction.moveToY(self.frame.size.height * 1.42, duration: 4.0))
        
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
    
    func collition() {
        print("Hit")
        //projectile.removeFromParent()
        fish1.removeFromParent()
    }
   
//    override func update(currentTime: CFTimeInterval) {
//        
//        //updateEnemies()
//     
//
//    }
//    
//    private func updateEnemies() {
//        
//        var enemiesToRemove:[SKNode] = []
//        for node in self.children {
//            if CGRectContainsPoint(hook.frame, node.position) {
//                // Mark enemy for removal
//                enemiesToRemove.append(node)
//                print("test hit",node.frame, terminator: "")
//                continue
//            }
//        }
//        self.removeChildrenInArray(enemiesToRemove)
//    }

    func didBeginContact(contact: SKPhysicsContact) {
        let a: SKPhysicsBody = contact.bodyA
        let b: SKPhysicsBody = contact.bodyB
        print("a:",a.categoryBitMask,"b:",b.categoryBitMask)
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==Fish1Category){
            print("Fish1")
            
            numPoints += 1
            points.text = "\(numPoints)"
            
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==Fish2Category){
            print("Fish2")
            numPoints += 1
            points.text = "\(numPoints)"
        }
        
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==ShoesCategory){
            print("Shoes")
            seconds -= 10
            
            
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==CansCategory){
            print("Can")
            seconds -= 10
           
        }

    }
    
    

    
 }
