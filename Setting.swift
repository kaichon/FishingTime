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
    let dad = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 80, height: 8))
    
    let soundDefault = NSUserDefaults.standardUserDefaults()
    
    let backgroundMusic = SKAudioNode(fileNamed: "background.mp3")

//    var num = UInt()
    
    
        override func didMoveToView(view: SKView) {
            
        let bgsetting = SKSpriteNode(imageNamed: "bgsetting")
        bgsetting.position = CGPointMake(self.size.width / 2, self.size.height/2)
        //        bgmanu.size = CGSizeMake(1136/2, 640/2)
        //iphon 5s
        bgsetting.size.width = 1136/2
        bgsetting.size.height = 640/2
        addChild(bgsetting)
            
            
        volume.position = CGPointMake(size.width * 0.3, size.height * 0.45)
        volume.size = CGSizeMake(65, 60)
        addChild(volume)
            
        dad.position = CGPointMake(size.width * 0.3, size.height * 0.45)
            
        on.position = CGPointMake(size.width * 0.6, size.height * 0.45)
        on.size = CGSizeMake(130,40)
            
        off.position = CGPointMake(size.width * 0.6, size.height * 0.45)
        off.size = CGSizeMake(130,40)
            
            
       
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
        btnclose.size = CGSizeMake(34,35)
        addChild(btnclose)
            
       
         
        //ButtonClose2    
        btnclose2.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
        btnclose2.size = CGSizeMake(34,35)
            
    /*------------------------------------------------------------------------------*/
            
            
//            let soundDefault = NSUserDefaults.standardUserDefaults()
            if (soundDefault.valueForKey("soundStatus") != nil){
                soundStatus = soundDefault.valueForKey("soundStatus") as! Int!
                print("soundMain\(soundStatus)")
            }

            
           
            if soundStatus == 1 {
                addChild(off)
                addChild(dad)
            }
            else{
                addChild(on)
                backgroundMusic.autoplayLooped = true
                addChild(backgroundMusic)

            }
            
           
                
                //
            
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if btnclose.containsPoint(location){
                addChild(btnclose2)
            
            }else if off.containsPoint(location){
                if soundStatus  == 1{
                    off.removeFromParent()
                    dad.removeFromParent()
                    addChild(on)
                    backgroundMusic.autoplayLooped = true
                    addChild(backgroundMusic)
                    //num--
                    //print(num)
                    
                    soundStatus = 0
                    Sound()
                    print("soundSet\(soundStatus)")
                }else{
                    on.removeFromParent()
                    addChild(off)
                    addChild(dad)
                    backgroundMusic.removeFromParent()
                    //num++
                    //print(num)
                    
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

    func Sound(){
//        let soundDefault = NSUserDefaults.standardUserDefaults()
        soundDefault.setValue(soundStatus, forKey: "soundStatus")
        soundDefault.synchronize()
        print("soundAA\(soundStatus)")
    }

    
}