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
    
    let btnclose = SKSpriteNode(imageNamed: "close")
    
    
    let btnclose2 = SKSpriteNode(imageNamed: "close2")
    
    override func didMoveToView(view: SKView) {
        
        let bghighScore = SKSpriteNode(imageNamed: "bgHighScore")
        bghighScore.position = CGPointMake(self.size.width / 2, self.size.height/2)
        //        bgmanu.size = CGSizeMake(1136/2, 640/2)
        //iphon 5s
        bghighScore.size.width = 1136/2
        bghighScore.size.height = 640/2
        addChild(bghighScore)
        
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
        btnclose.size = CGSizeMake(34,35)
        addChild(btnclose)
        
        //------------------------------------------------------------------------------
        
        //ButtonClose2
        btnclose2.position = CGPointMake(self.size.width * 0.88, self.size.height * 0.85)
        btnclose2.size = CGSizeMake(34,35)
        
        
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