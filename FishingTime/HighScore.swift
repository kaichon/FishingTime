//
//  HighScore.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 19/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//


import Foundation
import SpriteKit
import UIKit

@available(iOS 9.0, *)
class HighScore: SKScene {
    
    var status = Setting()
    
    let btnclose = SKSpriteNode(imageNamed: "close")
    let btnclose2 = SKSpriteNode(imageNamed: "close2")
    let bghighScore = SKSpriteNode(imageNamed: "bgHighScore")
    
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
    
    
    
}