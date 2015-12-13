//
//  Control.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 13/12/58.
//  Copyright © พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import Foundation
import SpriteKit
import Foundation
class Control: SKNode{
    let hook = SKSpriteNode(imageNamed: "hook")
    
    override init() {
        super.init()
        name = "Control\(self)"
        
        hook.size = CGSize(width: 18,height: 18)
        addhook()
        
        let body = SKPhysicsBody(rectangleOfSize: hook.size)
        body.dynamic = false
        body.affectedByGravity = false
        body.allowsRotation = false
        body.categoryBitMask = HookCategory
        body.contactTestBitMask =  HookCategory | Fish1Category | Fish2Category | ShoesCategory | CansCategory
        body.collisionBitMask = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addhook(){
        hook.size = CGSize(width: 18,height: 18)
        addChild(hook)
        
    }
    
}