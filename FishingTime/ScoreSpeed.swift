//
//  ScoreSpeed.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 7/12/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//


import Foundation
import SpriteKit
import UIKit
import AVFoundation

@available(iOS 9.0, *)
class ScoreSpeed: SKScene , SKPhysicsContactDelegate{
    
    let scoreSpeed = Speed()

    let bgscore = SKSpriteNode(imageNamed: "bgscore")
    let ok = SKSpriteNode(imageNamed: "ok")
    let ok2 = SKSpriteNode(imageNamed: "ok2")
    var text1 = SKLabelNode(text: "จำนวนปลา")
    var text2 = SKLabelNode(text: "ตัว")
    var textscore1 = SKLabelNode(text: "0")
    var score1 = 0
    
    
    override func didMoveToView(view: SKView)  {
        
        bgscore.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bgscore.size.width = frame.size.width
        bgscore.size.height = frame.size.height
        addChild(bgscore)
        // Button-
        ok.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.25)
        ok.size.width = size.width / 4
        ok.size.height = size.height / 7.5
        addChild(ok)
        
        ok2.position = CGPointMake(self.size.width * 0.5 , self.size.height * 0.25)
        ok2.size.width = size.width / 4
        ok2.size.height = size.height / 7.5
        
        text1.position = CGPoint(x: frame.size.width * 0.28, y: frame.size.height * 0.45)
        text1.fontColor = UIColor.blackColor()
        text1.fontSize = 35
        text1.fontName = "Courier"
        addChild(text1)
        
        text2.position = CGPoint(x: frame.size.width * 0.67, y: frame.size.height * 0.45)
        text2.fontColor = UIColor.blackColor()
        text2.fontSize = 35
        text2.fontName = "Courier"
        addChild(text2)

        
        textscore1.position = CGPoint(x: frame.size.width * 0.5, y: frame.size.height * 0.45)
        textscore1.fontColor = UIColor.redColor()
        textscore1.fontSize = 50
        textscore1.fontName = "Courier"
        
        
        let scoreDefault = NSUserDefaults.standardUserDefaults()
        if (scoreDefault.valueForKey("speedScore") != nil){
            scoreSpeed.speedScore = scoreDefault.valueForKey("speedScore") as! Int!
            print("scoreMain\(scoreSpeed.speedScore)")
            
        }
        
        score1 = scoreSpeed.speedScore
        textscore1.text = "\(score1)"
        addChild(textscore1)
    
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            if ok.containsPoint(location){
                addChild(ok2)
                
            }
            
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            if ok.containsPoint(location){
                ok2.removeFromParent()
                
            }
        }
        
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if ok2.containsPoint(location){
                
                let playScene = GameScene(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
                
            }
            
        }
        
    }

    
}