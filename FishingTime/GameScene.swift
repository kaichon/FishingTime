//
//  GameScene.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 18/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import SpriteKit
import AVFoundation


@available(iOS 9.0, *)


class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var status = Setting()
    
    
    
    let bgmanu = SKSpriteNode(imageNamed: "manu")
    let btnStart = SKSpriteNode(imageNamed: "Start")
    let btnSetting = SKSpriteNode(imageNamed: "setting")
    let btnHighScore = SKSpriteNode(imageNamed: "HighScore")
    
    let btnStart2 = SKSpriteNode(imageNamed: "Start2")
    let btnSetting2 = SKSpriteNode(imageNamed: "setting2")
    let btnHighScore2 = SKSpriteNode(imageNamed: "HighScore2")

    
    override func didMoveToView(view: SKView) {
        
        bgmanu.position = CGPointMake(size.width * 0.5, size.height/2)
        //bgmanu.size = CGSizeMake(1136/2, 640/2)
        bgmanu.size.width = frame.size.width
        bgmanu.size.height = frame.size.height
        addChild(bgmanu)
        
        
        //ButtonStart
        btnStart.position = CGPointMake(frame.size.width * 0.7, frame.size.height * 0.75)
//        btnStart.size = CGSizeMake(140,55)
        btnStart.size.width = size.width / 4
        btnStart.size.height = size.height / 5
        addChild(btnStart)
        
        //ButtonSetting
        btnSetting.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.5)
//        btnSetting.size = CGSizeMake(140,55)
        btnSetting.size.width = size.width / 4
        btnSetting.size.height = size.height / 5
        addChild(btnSetting)
        
        //ButtonHighScore
        btnHighScore.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.25)
//        btnHighScore.size = CGSizeMake(140,55)
        btnHighScore.size.width = size.width / 4
        btnHighScore.size.height = size.height / 5
        addChild(btnHighScore)
        
        
        //---------------------------------------------------------------------------------
        
        //ButtonStart2
        btnStart2.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.75)
//        btnStart2.size = CGSizeMake(140,55)
        btnStart2.size.width = size.width / 4
        btnStart2.size.height = size.height / 5

        
        //ButtonSetting
        btnSetting2.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.5)
//        btnSetting2.size = CGSizeMake(140,55)
        btnSetting2.size.width = size.width / 4
        btnSetting2.size.height = size.height / 5
        
        //ButtonHighScore
        btnHighScore2.position = CGPointMake(self.size.width * 0.7, self.size.height * 0.25)
        btnHighScore2.size = CGSizeMake(140,55)
        btnHighScore2.size.width = size.width / 4
        btnHighScore2.size.height = size.height / 5

        

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

            if btnStart.containsPoint(location){
                addChild(btnStart2)
            
            }else if btnSetting2.containsPoint(location){
                addChild(btnSetting2)
                
            }else if btnHighScore2.containsPoint(location){
                addChild(btnHighScore2)
            }
            
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            if btnStart.containsPoint(location){
                btnStart2.removeFromParent()
                
            }else if btnSetting.containsPoint(location){
                btnSetting2.removeFromParent()
                
            }else if btnHighScore.containsPoint(location){
                btnHighScore2.removeFromParent()
                
            }
        }
        
    }
     override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if btnStart.containsPoint(location){
    
                let playScene = Play(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
                
            }else if btnSetting.containsPoint(location){
                let playScene = Setting(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
                
            }else if btnHighScore.containsPoint(location){
                let playScene = HighScore(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
                
            }
            
            
        }
        
    }
   
    //
    //    override func update(currentTime: CFTimeInterval) {
    //        /* Called before each frame is rendered */
    //    }
}
