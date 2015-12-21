//
//  GameOver.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 21/12/58.
//  Copyright © พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import AVFoundation

@available(iOS 9.0, *)
class GameOver : SKScene , SKPhysicsContactDelegate{
    
    let bgscore = SKSpriteNode(imageNamed: "bgGameOver")
    let ok = SKSpriteNode(imageNamed: "ok")
    let ok2 = SKSpriteNode(imageNamed: "ok2")
    
    
    
    
    override func didMoveToView(view: SKView)  {
        
        bgscore.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bgscore.size.width = frame.size.width
        bgscore.size.height = frame.size.height
        addChild(bgscore)
        // Button-
        ok.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.25)
        ok.size.width = size.width / 4
        ok.size.height = size.height / 7.5
        addChild(ok)
        
        ok2.position = CGPointMake(self.size.width * 0.5 , self.size.height * 0.25)
        ok2.size.width = size.width / 4
        ok2.size.height = size.height / 7.5
        
               
        
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
                
               
                let playScene = LevelOne(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
                
                
            }
            
        }
        
    }
    
    
}