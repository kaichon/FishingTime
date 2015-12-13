//
//  Rope.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 13/12/58.
//  Copyright © พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import Foundation
import SpriteKit
import Foundation
class Rope: SKNode{
    let rope = SKSpriteNode(imageNamed: "rope")
    
    override init() {
        super.init()
        name = "Rope\(self)"
        
        addrope()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addrope(){
        rope.size = CGSize(width: 2, height: 301)
        addChild(rope)
        
    }
    
}