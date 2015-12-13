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


    let bgscore = SKSpriteNode(imageNamed: "bgscore")
    let ok = SKSpriteNode(imageNamed: "ok")
    let ok2 = SKSpriteNode(imageNamed: "ok2")
    
    override func didMoveToView(view: SKView)  {
        
        bgscore.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bgscore.size.width = 1136/2
        bgscore.size.height = 640/2
        addChild(bgscore)
        // Button-
        ok.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.25)
        ok.size = CGSizeMake(160,50)
        addChild(ok)
        
        ok2.position = CGPointMake(self.size.width * 0.5 , self.size.height * 0.25)
        ok2.size = CGSizeMake(160,50)
    
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