//
//  LevelOne.swift
//  FishingTime
//
//  Created by Tawee Thaicharoen on 20/5/58.
//  Copyright (c) พ.ศ. 2558 Wichitra Wae-useng. All rights reserved.
//

import SpriteKit
import AVFoundation
import GameplayKit

@available(iOS 9.0, *)
class LevelOne: SKScene , SKPhysicsContactDelegate{
    
    var status = Setting()

    
    private var fish1 = Fish1()
    private var fish2 = Fish2()
    private var shoes = Shoes()
    private var cans = Cans()
    let hook = Control()
    
    var timeOut = SKLabelNode(text: "0")
    var seconds = 0
    var timer = NSTimer()
    //private var rope2:Rope
    
    var level = SKLabelNode(text: "level 1")
    
    var points = SKLabelNode(text: "0")
    let fullscore = SKLabelNode(text: "/3")
    var numPoints = 0
    
    let bg = SKSpriteNode(imageNamed: "BGLavel1")
    let btnclose = SKSpriteNode(imageNamed: "close")
    
    let man = SKSpriteNode(imageNamed: "man")
    
    let rope = SKSpriteNode(imageNamed: "rope")

    /*
    override init() {
        //rope2 = Rope(
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    override func didMoveToView(view: SKView)  {
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        
        
        bg.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bg.size.width = frame.size.width
        bg.size.height = frame.size.height
        addChild(bg)
       
        // ตำแหน่งการแสดงคะแนน ในหน้าจอ
        points.position = CGPoint(x: frame.size.width * 0.88, y: frame.size.height * 0.93)
        points.fontColor = UIColor.redColor()
        points.fontSize = 20
        points.fontName = "Courier"
        addChild(points)
        
        fullscore.position = CGPoint(x: frame.size.width * 0.91, y: frame.size.height * 0.93)
        fullscore.fontColor = UIColor.redColor()
        fullscore.fontSize = 20
        fullscore.fontName = "Courier"
        addChild(fullscore)
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.97, self.size.height * 0.94)
        btnclose.size.width = size.width / 20
        btnclose.size.height = size.height / 12.5
        addChild(btnclose)
        
       
        level.position = CGPointMake(self.size.width / 2, self.size.height/2)
        level.fontSize = 30
        level.fontColor = UIColor.redColor()
        addChild(level)
        
        setupGame()
        backgroundColor = SKColor.whiteColor()
        
        timeOut.fontSize = 20
        timeOut.fontName = "Courier"
        timeOut.fontColor = UIColor.blackColor()
        timeOut.position = CGPoint(x: frame.size.width * 0.05, y: frame.size.height * 0.86 )
        addChild(timeOut)
        
        
        
        //  All Enemy ----------------------------
        
        fish1.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish1)
        
        
        shoes.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(shoes)
        
        cans.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(cans)
        
        // --------- คนตกปลา เบ็ด------------------
        man.position = CGPointMake(self.size.width * 0.26 , self.size.height * 0.69)
        man.size.width = size.width/1.9
        man.size.height = size.height/1.6
        addChild(man)
        
        rope.position = CGPointMake(self.size.width * 0.52 , self.size.height * 1.42)
        rope.size.width = size.width / 200
        rope.size.height = size.height
        addChild(rope)
        
        hook.position = CGPointMake(self.size.width * 0.52 , self.size.height * 0.9)
        addChild(hook)

        let soundDefault = NSUserDefaults.standardUserDefaults()
        if (soundDefault.valueForKey("soundStatus") != nil){
            status.soundStatus = soundDefault.valueForKey("soundStatus") as! Int!
            print("soundMain\(status.soundStatus)")
        }
        
        if status.soundStatus == 1 {
            print("1")
            
        }
        else{
            let backgroundMusic = SKAudioNode(fileNamed: "background.mp3")
            backgroundMusic.autoplayLooped = true
            addChild(backgroundMusic)
            
        }

        
    }
    
    func setupGame()  {
        seconds = 120
        timeOut.text = "\(seconds)" //แสดงค่าเริ่มต้น
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
        
    }
    
    func subtractTime() {
        seconds--
        timeOut.text = "\(seconds)"  //แสดงตอนเวลานับถอยหลัง
        
        if(seconds <= 0)  {
            timer.invalidate()
            let Scene = ScoreLevel1(size: self.size)
            let transition = SKTransition.fadeWithDuration(0)
            self.scene!.view?.presentScene(Scene, transition: transition)
            
        }else if(seconds <= 115)  {
            level.removeFromParent()
        }
    }
//    
//    func controlHook(){
//        let hookmovwDown = (SKAction.moveToY(self.frame.size.height * 0.02, duration: 3.0))
//        let hookmoveUp = (SKAction.moveToY(self.frame.size.height * 0.9, duration: 2.0))
//        
//        let ropeDown = (SKAction.moveToY(self.frame.size.height * 0.54, duration: 3.0))
//        let ropeUp = (SKAction.moveToY(self.frame.size.height * 1.42, duration: 2.0))
//        
//        hook.runAction(SKAction.sequence([hookmovwDown, hookmoveUp]))
//        rope.runAction(SKAction.sequence([ropeDown, ropeUp]))
//        
//    }
    func hookMoveDown(){
        
        hook.runAction(SKAction.moveToY(self.frame.size.height * 0.02, duration: 5.0))
        rope.runAction(SKAction.moveToY(self.frame.size.height * 0.54, duration: 5.0))
        
    }
    func hookMoveUp(){
        
        hook.runAction(SKAction.moveToY(self.frame.size.height * 0.9, duration: 4.0))
        rope.runAction(SKAction.moveToY(self.frame.size.height * 1.42, duration: 4.0))
    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            hookMoveDown()
            
            if btnclose.containsPoint(location){
                let playScene = Play(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
            }
            
        }
    }
  
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hookMoveUp()
    }
    func didBeginContact(contact: SKPhysicsContact) {
        let a: SKPhysicsBody = contact.bodyA
        let b: SKPhysicsBody = contact.bodyB
        
        print("a:",a.categoryBitMask,"b:",b.categoryBitMask)
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == Fish1Category){
            print("Fish1")
            numPoints += 1
            points.text = "\(numPoints)"
            fish1.removeAllChildren()
            if status.soundStatus == 0 {
                runAction(SKAction.playSoundFileNamed("click.WAV", waitForCompletion: false))
            }
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==ShoesCategory){
            print("Shoes")
            seconds -= 10
            shoes.removeAllChildren()
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==CansCategory){
            print("Can")
            seconds -= 10
            cans.removeAllChildren()
        }
        
    }

    
}