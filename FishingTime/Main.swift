//
//  GameScene.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 18/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import SpriteKit
import AVFoundation

class Main: SKScene,SKPhysicsContactDelegate {
    
    let btnStart = SKSpriteNode(imageNamed: "Start")
    let btnSetting = SKSpriteNode(imageNamed: "setting")
    let btnHighScore = SKSpriteNode(imageNamed: "HighScore")
    
    
    override func didMoveToView(view: SKView) {
        let bgmanu = SKSpriteNode(imageNamed: "Manu.jpg")
        bgmanu.position = CGPointMake(self.size.width * 0.5, self.size.height/2)
        //        bgmanu.size = CGSizeMake(1136/2, 640/2)
        //iphon 5s
        bgmanu.size.width = 1136/2
        bgmanu.size.height = 640/2
        addChild(bgmanu)
        
        
        //ButtonStart
        
        btnStart.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.75)
        btnStart.size = CGSizeMake(140,55)
        addChild(btnStart)
        
        //ButtonSetting
        
        btnSetting.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.5)
        btnSetting.size = CGSizeMake(140,55)
        addChild(btnSetting)
        
        //ButtonHighScore
        btnHighScore.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.25)
        btnHighScore.size = CGSizeMake(140,55)
        addChild(btnHighScore)
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if btnStart.containsPoint(location){
                var playScene = Play(size: self.size)
                var transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
            }else if btnSetting.containsPoint(location){
                var playScene = Setting(size: self.size)
                var transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
                
            }else if btnHighScore.containsPoint(location){
                var playScene = HighScore(size: self.size)
                var transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
                
            }
            
            
        }
        
    }
    //
    //    override func update(currentTime: CFTimeInterval) {
    //        /* Called before each frame is rendered */
    //    }
}
