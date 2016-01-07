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
    
    var statusSound = Setting()
     let score = Speed()
    let timeOne = LevelOne()
    let timeTwo = LevelTwo()
    
    let btnclose = SKSpriteNode(imageNamed: "Close")
    let btnclose2 = SKSpriteNode(imageNamed: "Close2")
    let bghighScore = SKSpriteNode(imageNamed: "bgHighScore")
    
    var textscoreLevelone = SKLabelNode(text: "0")
    let highScoreLevelOneDefault = NSUserDefaults.standardUserDefaults()
    var highscoreLevel1 = 120
    var scoreLevel1 = 0
    
    var textscoreLeveltwo = SKLabelNode(text: "0")
    let highScoreLevelTwoDefault = NSUserDefaults.standardUserDefaults()
    var highscoreLevel2 = 120
    var scoreLevel2 = 0
    
    var textscoreSpeed = SKLabelNode(text: "0")
    let highScoreSpeedDefault = NSUserDefaults.standardUserDefaults()
    var highscorespeed = 0
    var scorespeed = 0
    
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
        
        
        //textLevelone
        textscoreLevelone.position = CGPoint(x: frame.size.width * 0.5, y: frame.size.height * 0.56)
        textscoreLevelone.fontColor = UIColor.redColor()
        textscoreLevelone.fontSize = 25
        textscoreLevelone.fontName = "Courier"
        
        //textLeveltwo
        textscoreLeveltwo.position = CGPoint(x: frame.size.width * 0.5, y: frame.size.height * 0.435)
        textscoreLeveltwo.fontColor = UIColor.redColor()
        textscoreLeveltwo.fontSize = 25
        textscoreLeveltwo.fontName = "Courier"
        
        //textSpeed
        textscoreSpeed.position = CGPoint(x: frame.size.width * 0.5, y: frame.size.height * 0.3)
        textscoreSpeed.fontColor = UIColor.redColor()
        textscoreSpeed.fontSize = 25
        textscoreSpeed.fontName = "Courier"
        

        
        
        let soundDefault = NSUserDefaults.standardUserDefaults()
        if (soundDefault.valueForKey("soundStatus") != nil){
            statusSound.soundStatus = soundDefault.valueForKey("soundStatus") as! Int!
            print("soundMain\(statusSound.soundStatus)")
        }
        
        if statusSound.soundStatus == 0 {
            let backgroundMusic = SKAudioNode(fileNamed: "soundHome.mp3")
            backgroundMusic.autoplayLooped = true
            addChild(backgroundMusic)
            
        }
        //Read LevelOne
        let scoreOneDefault = NSUserDefaults.standardUserDefaults()
        if (scoreOneDefault.valueForKey("scoreTime1") != nil){
            timeOne.scoreTime1 = scoreOneDefault.valueForKey("scoreTime1") as! Int!
            print("scoreOne\(timeOne.scoreTime1)")
        }
        
        //Read highScore Level1
        if (highScoreLevelOneDefault.valueForKey("highscoreLevel1") != nil){
            highscoreLevel1 = highScoreLevelOneDefault.valueForKey("highscoreLevel1") as! Int!
            print("HighScoreLevel1\(highscoreLevel1)")
            
        }
        
        scoreLevel1 = timeOne.scoreTime1
        
        
        if(scoreLevel1 <= highscoreLevel1){
            highscoreLevel1 = scoreLevel1
            levelOne()
            textscoreLevelone.text = "\(highscoreLevel1)"
            addChild(textscoreLevelone)
            
        }else{
            textscoreLevelone.text = "\(highscoreLevel1)"
            addChild(textscoreLevelone)
        }
        
        //------------------------------------------------------

        
        //Read LevelTwo
        let scoreTwoDefault = NSUserDefaults.standardUserDefaults()
        if (scoreTwoDefault.valueForKey("scoreTime2") != nil){
            timeTwo.scoreTime2 = scoreTwoDefault.valueForKey("scoreTime2") as! Int!
            print("scoreTwo\(timeTwo.scoreTime2)")
        }
        
        
        //Read highScore Level2
        if (highScoreLevelTwoDefault.valueForKey("highscoreLevel2") != nil){
            highscoreLevel2 = highScoreLevelTwoDefault.valueForKey("highscoreLevel2") as! Int!
            print("HighScoreLevel2\(highscoreLevel2)")
            
        }
        
        scoreLevel2 = timeTwo.scoreTime2
        
        
        if(scoreLevel2 <= highscoreLevel2){
            highscoreLevel2 = scoreLevel2
            levelTwo()
            textscoreLeveltwo.text = "\(highscoreLevel2)"
            addChild(textscoreLeveltwo)
            
        }else{
            textscoreLeveltwo.text = "\(highscoreLevel2)"
            addChild(textscoreLeveltwo)
        }
        
        //------------------------------------------------------

    
        //Read speed
        let scoreDefault = NSUserDefaults.standardUserDefaults()
        if (scoreDefault.valueForKey("speedScore") != nil){
            score.speedScore = scoreDefault.valueForKey("speedScore") as! Int!
            print("scoreMain\(score.speedScore)")
            
        }
        
        //Read highScore speed
        if (highScoreSpeedDefault.valueForKey("highscorespeed") != nil){
            highscorespeed = highScoreSpeedDefault.valueForKey("highscorespeed") as! Int!
            print("HighScoreSpeed\(highscorespeed)")
            
        }

        scorespeed = score.speedScore
        
        
        if(scorespeed >=  highscorespeed){
            highscorespeed = scorespeed
            scoreSpeed()
            textscoreSpeed.text = "\(highscorespeed)"
            addChild(textscoreSpeed)
            
        }else{
            textscoreSpeed.text = "\(highscorespeed)"
            addChild(textscoreSpeed)
        }
        
        //------------------------------------------------------

        
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
    func levelOne(){  // save
        highScoreLevelOneDefault.setValue(highscoreLevel1, forKey: "highscoreLevel1")
        highScoreLevelOneDefault.synchronize()
        print("HighLevel1save \(highscoreLevel1)")
    }

    func levelTwo(){
        highScoreLevelTwoDefault.setValue(highscoreLevel2, forKey: "highscoreLevel2")
        highScoreLevelTwoDefault.synchronize()
        print("HighLevel2save \(highscoreLevel2)")
    }

    
    func scoreSpeed(){
        highScoreSpeedDefault.setValue(highscorespeed, forKey: "highscorespeed")
        highScoreSpeedDefault.synchronize()
        print("HighSpeedsave \(highscorespeed)")
    }

    
    
}