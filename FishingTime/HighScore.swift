//
//  HighScore.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 19/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//


//import Foundation
//import SpriteKit
//import UIKit

import Foundation
import SpriteKit
import UIKit
import AVFoundation

@available(iOS 9.0, *)
class HighScore: SKScene , SKPhysicsContactDelegate{
    
    var status = Setting()
     let score = Speed()
    
    let btnclose = SKSpriteNode(imageNamed: "Close")
    let btnclose2 = SKSpriteNode(imageNamed: "Close2")
    let bghighScore = SKSpriteNode(imageNamed: "bgHighScore")
    var textscoreSpeed = SKLabelNode(text: "0")
    var textspeed = 0
    let scoreDefault = NSUserDefaults.standardUserDefaults()
    
    override func didMoveToView(view: SKView) {
        
        bghighScore.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bghighScore.size.width = frame.size.width
        bghighScore.size.height = frame.size.height
        addChild(bghighScore)
        
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
        btnclose.size.width = size.width / 15.5
        btnclose.size.height = size.height / 9.5
        addChild(btnclose)
        
        //------------------------------------------------------------------------------
        
        //ButtonClose2
        btnclose2.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
        btnclose2.size.width = size.width / 15.5
        btnclose2.size.height = size.height / 9.5
        
        textscoreSpeed.position = CGPoint(x: frame.size.width * 0.67, y: frame.size.height * 0.5)
        textscoreSpeed.fontColor = UIColor.redColor()
        textscoreSpeed.fontSize = 25
        textscoreSpeed.fontName = "Courier"
        addChild(textscoreSpeed)
        
        
        let soundDefault = NSUserDefaults.standardUserDefaults()
        if (soundDefault.valueForKey("soundStatus") != nil){
            status.soundStatus = soundDefault.valueForKey("soundStatus") as! Int!
            print("soundMain\(status.soundStatus)")
        }
        
        if status.soundStatus == 0 {
            let backgroundMusic = SKAudioNode(fileNamed: "soundHome.mp3")
            backgroundMusic.autoplayLooped = true
            addChild(backgroundMusic)
            
        }

        
        if (scoreDefault.valueForKey("sscore") != nil){
            score.sscore = scoreDefault.valueForKey("sscore") as! Int!
            print("scoreMain\(score.sscore)")
            
        }
        
        textspeed = score.sscore
        print(textspeed)
        textscoreSpeed.text = "\(textspeed)"
        addChild(textscoreSpeed)
        
//        if(textspeed >= score.sscore){
//            textscoreSpeed.text = "\(textspeed)"
//            addChild(textscoreSpeed)
//            scoreSpeed()
//        }
        
        

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if btnclose.containsPoint(location){
                addChild(btnclose2)
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if btnclose.containsPoint(location){
                btnclose2.removeFromParent()
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
            for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if btnclose.containsPoint(location){
                let playScene = GameScene(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
            }
            
            
        }
        
    }
    
//    func scoreSpeed(){  //การ save ค่า (การจดจำค่า)
//        scoreDefault.setValue(textspeed, forKey: "textspeed")
//        scoreDefault.synchronize()
//        print("Scorespeed \(textspeed)")
//    }

    
    
}