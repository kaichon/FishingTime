//
//  Play.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 19/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

@available(iOS 9.0, *)
class Play: SKScene {
    var status = Setting()
    
    let bgmode = SKSpriteNode(imageNamed: "bgmode.jpg")
    let btnlevel = SKSpriteNode(imageNamed: "level")
    let btnspeed = SKSpriteNode(imageNamed: "speed")
    let btnclose = SKSpriteNode(imageNamed: "close")
    
    let btnlevel2 = SKSpriteNode(imageNamed: "level2")
    let btnspeed2 = SKSpriteNode(imageNamed: "speed2")
    let btnclose2 = SKSpriteNode(imageNamed: "close2")
    
    override func didMoveToView(view: SKView) {
        
        bgmode.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bgmode.size.width = frame.size.width
        bgmode.size.height = frame.size.height
        addChild(bgmode)
        
        //ButtonLevel
        btnlevel.position = CGPointMake(self.size.width * 0.3, self.size.height * 0.5)
        btnlevel.size.width = size.width / 3.3
        btnlevel.size.height = size.height / 5.5
        addChild(btnlevel)
        
        //ButtonSpeed
        btnspeed.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.5)
        btnspeed.size.width = size.width / 3.3
        btnspeed.size.height = size.height / 5.5
        addChild(btnspeed)
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
        btnclose.size.width = size.width / 15.5
        btnclose.size.height = size.height / 9.5

        addChild(btnclose)
        
        
        //==============================================================================
        //ButtonLevel2
        btnlevel2.position = CGPointMake(self.size.width * 0.3, self.size.height * 0.5)
//        btnlevel2.size = CGSizeMake(170,60)
        btnlevel2.size.width = size.width / 3.3
        btnlevel2.size.height = size.height / 5.5
       
        
        //ButtonSpeed2
        btnspeed2.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.5)
//        btnspeed2.size = CGSizeMake(170,60)
        btnspeed2.size.width = size.width / 3.3
        btnspeed2.size.height = size.height / 5.5
        
        //ButtonClose2
        btnclose2.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
        btnclose2.size.width = size.width / 15.5
        btnclose2.size.height = size.height / 9.5
        
        
        let soundDefault = NSUserDefaults.standardUserDefaults()
        if (soundDefault.valueForKey("soundStatus") != nil){
            status.soundStatus = soundDefault.valueForKey("soundStatus") as! Int!
            print("soundMain\(status.soundStatus)")
        }
        
        if status.soundStatus == 1 {
            print("1")
            
        }
        else{
            let backgroundMusic = SKAudioNode(fileNamed: "background.mp3")
            backgroundMusic.autoplayLooped = true
            addChild(backgroundMusic)
            
        }

        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            if btnclose.containsPoint(location){
                addChild(btnclose2)
                
            }else if btnspeed.containsPoint(location){
                addChild(btnspeed2)
                
            }else if btnlevel.containsPoint(location){
                addChild(btnlevel2)
                
            }
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            if btnclose.containsPoint(location){
                btnclose2.removeFromParent()
                
            }else if btnspeed.containsPoint(location){
                btnspeed2.removeFromParent()
                
            }else if btnlevel.containsPoint(location){
                btnlevel2.removeFromParent()
                
            }
        }
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if btnclose.containsPoint(location){
                let playScene = GameScene(size: self.size)
                let transition = SKTransition.fadeWithDuration(1)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
            }else if btnspeed.containsPoint(location){
                let speedScene = Speed(size: self.size)
                let transition = SKTransition.fadeWithDuration(1.5)
                self.scene!.view?.presentScene(speedScene, transition: transition)

            }else if btnlevel.containsPoint(location){
                let LevelScene = LevelOne(size: self.size)
                let transition = SKTransition.fadeWithDuration(1.5)
                self.scene!.view?.presentScene(LevelScene, transition: transition)
                
            }
            
            
        }
        
    }
    

    
}