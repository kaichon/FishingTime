//
//  GameViewController.swift
//  FishingTime
//
//  Created by Wichitra Wae-useng on 18/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import UIKit
import SpriteKit

@available(iOS 9.0, *)
extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks")
        
        let sceneData = try! NSData(contentsOfFile:path!, options: .DataReadingMappedIfSafe)
        let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
        
        archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
        let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
        archiver.finishDecoding()
        return scene
    }
}

@available(iOS 9.0, *)
class GameViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
//        skView.showsFPS = false
//        skView.showsNodeCount = false
//        skView.ignoresSiblingOrder = false
//        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
        
        
        

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
}
