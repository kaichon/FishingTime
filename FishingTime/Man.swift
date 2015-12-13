//
//  Man.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 13/12/58.
//  Copyright © พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import Foundation
import SpriteKit
import Foundation
class Man: SKNode{
    let man = SKSpriteNode(imageNamed: "man")
    
    override init() {
        super.init()
        name = "Man\(self)"
        
        addman()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addman(){
        man.size = CGSize(width: 300, height: 200)
        addChild(man)
        
    }
    
}