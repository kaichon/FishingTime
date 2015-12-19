//
//  Setting.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 19/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

@available(iOS 9.0, *)

class Setting: SKScene {
    
    var soundStatus = 0
    
    let btnclose = SKSpriteNode(imageNamed: "close")
    let btnclose2 = SKSpriteNode(imageNamed: "close2")
    let on = SKSpriteNode(imageNamed: "on")
    let off = SKSpriteNode(imageNamed: "off")
    let volume = SKSpriteNode(imageNamed: "volume")
    let novolume = SKSpriteNode(imageNamed: "volumeNo")
    
    let soundDefault = NSUserDefaults.standardUserDefaults()
    
    let backgroundMusic = SKAudioNode(fileNamed: "soundHome.mp3")
    
    let bgsetting = SKSpriteNode(imageNamed: "bgsetting")
    
    
        override func didMoveToView(view: SKView) {
            
        
            bgsetting.position = CGPointMake(frame.size.width / 2, frame.size.height/2)
            bgsetting.size.width = frame.size.width
            bgsetting.size.height = frame.size.height
            addChild(bgsetting)
            
            
            volume.position = CGPointMake(size.width * 0.3, size.height * 0.45)
            volume.size.width = size.width / 8
            volume.size.height = size.height / 5.5
            addChild(volume)
            
            novolume.position = CGPointMake(size.width * 0.3, size.height * 0.45)
            novolume.size.width = size.width / 8
            novolume.size.height = size.height / 5.5
            
            
            on.position = CGPointMake(size.width * 0.6, size.height * 0.45)
            on.size.width = size.width / 5
            on.size.height = size.height / 7
            
            off.position = CGPointMake(size.width * 0.6, size.height * 0.45)
            off.size.width = size.width / 5
            off.size.height = size.height / 7

            
            //ButtonClose
            btnclose.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
            btnclose.size.width = size.width / 15.5
            btnclose.size.height = size.height / 9.5
            addChild(btnclose)
            
            
            //ButtonClose2
            btnclose2.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
            btnclose2.size.width = size.width / 15.5
            btnclose2.size.height = size.height / 9.5

            
    /*------------------------------------------------------------------------------*/
            
            //การอ่านค่า
            if (soundDefault.valueForKey("soundStatus") != nil){
                soundStatus = soundDefault.valueForKey("soundStatus") as! Int!
                print("soundMain\(soundStatus)")
            }

            
           
            if soundStatus == 1 {
                addChild(off)
                addChild(novolume)
                volume.removeFromParent()
            }
            else{
                addChild(on)
                backgroundMusic.autoplayLooped = true
                addChild(backgroundMusic)

            }
            
           
            
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if btnclose.containsPoint(location){
                addChild(btnclose2)
            
            }else if off.containsPoint(location){
                if soundStatus  == 1{
                    off.removeFromParent()
                    novolume.removeFromParent()
                    addChild(on)
                    addChild(volume)
                    backgroundMusic.autoplayLooped = true
                    addChild(backgroundMusic)
                    
                    soundStatus = 0
                    Sound()
                    print("soundSet\(soundStatus)")
                }else{
                    on.removeFromParent()
                    volume.removeFromParent()
                    addChild(off)
                    addChild(novolume)
                    backgroundMusic.removeFromParent()
                    
                    soundStatus = 1
                    Sound()
                    print("soundSet\(soundStatus)")
                }

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

    func Sound(){  //การ save ค่า (การจดจำค่า)
        soundDefault.setValue(soundStatus, forKey: "soundStatus")
        soundDefault.synchronize()
        print("soundAA\(soundStatus)")
    }

    
}