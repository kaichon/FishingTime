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
import AudioToolbox
@available(iOS 9.0, *)
class Speed: SKScene , SKPhysicsContactDelegate{
    
    var status = Setting()
    
    private var fish1 = Fish1()
    private var fish2 = Fish2()
    private var shoes = Shoes()
    private var cans = Cans()
    private var hook = Control()
    
    var timeOut = SKLabelNode(text: "0")
    var seconds = 0
    var timer = NSTimer()
    let bg = SKSpriteNode(imageNamed: "BGSpeed")
    let btnclose = SKSpriteNode(imageNamed: "close")
    
    
    var points = SKLabelNode(text: "0")
    var numPoints = 0
    

    let man = SKSpriteNode(imageNamed: "man")
    let rope = SKSpriteNode(imageNamed: "rope")
    let pp = SKSpriteNode(imageNamed: "p")

    let hitFish1 = SKSpriteNode(imageNamed: "fish")
    let hitFish2 = SKSpriteNode(imageNamed: "chon")
    
    var reduce = SKLabelNode(text: " - 10s ! ")
    var reduce1 = SKLabelNode(text: " - 10s ! ")
    
    override func didMoveToView(view: SKView)  {
        
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        
        setupGame()
        
        bg.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bg.size.width = frame.size.width
        bg.size.height = frame.size.height
        addChild(bg)
        print(bg.frame)
        
        // ตำแหน่งการแสดงคะแนน ในหน้าจอ ------------------------------------------------------
        points.position = CGPoint(x: frame.size.width * 0.89, y: frame.size.height * 0.9)
        points.fontColor = UIColor.redColor()
        points.fontSize = 30
        points.fontName = "Courier"
        addChild(points)
   
        
        //-----------------------------------------------------------------------------------
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.97, self.size.height * 0.94)
        btnclose.size.width = size.width / 20
        btnclose.size.height = size.height / 12.5
        addChild(btnclose)        
        
        
        timeOut.fontSize = 20
        timeOut.fontName = "Courier"
        timeOut.fontColor = UIColor.blackColor()
        timeOut.position = CGPoint(x: frame.size.width * 0.05, y: frame.size.height * 0.86 )
        addChild(timeOut)
        
        
                // --------- คนตกปลา เบ็ด------------------
        man.position = CGPointMake(self.size.width * 0.26 , self.size.height * 0.69)
        man.size.width = size.width / 1.9
        man.size.height = size.height / 1.6
        addChild(man)
        
        rope.position = CGPointMake(self.size.width * 0.52 , self.size.height * 1.42)
        rope.size.width = size.width / 200
        rope.size.height = size.height
        addChild(rope)
        
        hook.position = CGPointMake(self.size.width * 0.52 , self.size.height * 0.9)
        addChild(hook)
        
    
        
        //  All Enemy ----------------------------
        
        fish1.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish1)
        
        fish2.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish2)
        
        
        shoes.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(shoes)
        
        cans.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(cans)
        
        pp.position = CGPointMake(self.size.width * 0.52, self.size.height * 0.99)
        pp.size.width = size.width / 4
        pp.size.height = size.height / 15
        addChild(pp)

        
        
        let soundDefault = NSUserDefaults.standardUserDefaults()
        if (soundDefault.valueForKey("soundStatus") != nil){
            status.soundStatus = soundDefault.valueForKey("soundStatus") as! Int!
            print("soundMain\(status.soundStatus)")
        }
        
        if status.soundStatus == 0 {
            let backgroundMusic = SKAudioNode(fileNamed: "background.mp3")
            backgroundMusic.autoplayLooped = true
            addChild(backgroundMusic)
            
        }

       
    }
    
    
    func setupGame()  {
        seconds = 50
        timeOut.text = "\(seconds)" //แสดงค่าเริ่มต้น
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
    }
    
    func subtractTime() {
        seconds--
        timeOut.text = "\(seconds)"  //แสดงตอนเวลานับถอยหลัง
        
        if(seconds <= 0)  {
            timer.invalidate()
            
            let ScoreSpeedScene = ScoreSpeed(size: self.size)
            let transition = SKTransition.fadeWithDuration(0)
            self.scene!.view?.presentScene(ScoreSpeedScene, transition: transition)
        }
        
    }
    
    func controlHook(){
        let positionUp = self.frame.size.height * 0.85
        
        if(Int(hook.position.y) >= Int(positionUp)){
            
            let hookmovwDown = (SKAction.moveToY(self.frame.size.height * 0.02, duration: 2.5))
            let hookmoveUp = (SKAction.moveToY(self.frame.size.height * 0.9, duration: 2.0))
        
            let ropeDown = (SKAction.moveToY(self.frame.size.height * 0.54, duration: 2.5))
            let ropeUp = (SKAction.moveToY(self.frame.size.height * 1.42, duration: 2.0))
        
            hook.runAction(SKAction.sequence([hookmovwDown, hookmoveUp]))
            rope.runAction(SKAction.sequence([ropeDown, ropeUp]))
        }
    }
    func hookMoveUp(){
        
        hook.runAction(SKAction.moveToY(self.frame.size.height * 0.9, duration: 3.0))
        rope.runAction(SKAction.moveToY(self.frame.size.height * 1.42, duration: 3.0))
    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            controlHook()
            
            if btnclose.containsPoint(location){
                let playScene = Play(size: self.size)
                let transition = SKTransition.fadeWithDuration(0)
                self.scene!.view?.presentScene(playScene, transition: transition)
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
   
    
    func didBeginContact(contact: SKPhysicsContact) {
        let a: SKPhysicsBody = contact.bodyA
        let b: SKPhysicsBody = contact.bodyB
        
        print("a:",a.categoryBitMask,"b:",b.categoryBitMask)
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==Fish1Category){
            print("Fish1")
            numPoints += 1
            points.text = "\(numPoints)"
            hitFish_1()
            fish1.removeAllChildren()
//            hook.runAction(SKAction.moveToY(self.frame.size.height * 0.9, duration: 3.0))
//            rope.runAction(SKAction.moveToY(self.frame.size.height * 1.42, duration: 3.0))
            hookMoveUp()
            if status.soundStatus == 0 {
            runAction(SKAction.playSoundFileNamed("click.WAV", waitForCompletion: false))
            }
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==Fish2Category){
            print("Fish2")
            numPoints += 1
            points.text = "\(numPoints)"
            hitFish_2()
            fish2.removeAllChildren()
            hookMoveUp()
            if status.soundStatus == 0 {
                runAction(SKAction.playSoundFileNamed("click.WAV", waitForCompletion: false))
            }
        }
        
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==ShoesCategory){
            print("Shoes")
            seconds -= 10
            shoes.removeAllChildren()
            reduceTime()
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask==CansCategory){
            print("Can")
            seconds -= 10
            cans.removeAllChildren()
            reduceTime1()
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }

    }
    
    func hitFish_1(){
        
        hitFish1.position = CGPoint(x: frame.size.width * 0.52 , y: frame.size.height * 0.15)
        hitFish1.size.width = 60
        hitFish1.size.height = 35
        hitFish1.zRotation = CGFloat(M_PI) * 1.5
        addChild(hitFish1)
        let aa = (SKAction.moveToY(self.frame.size.height * 0.7, duration: 2.5))
        let bb = SKAction.removeFromParent()
        hitFish1.runAction(SKAction.sequence([aa,bb]))
    }
    
    func hitFish_2(){
        
        hitFish2.position = CGPoint(x: frame.size.width * 0.52 , y: frame.size.height * 0.15)
        hitFish2.size.width = 80
        hitFish2.size.height = 33
        hitFish2.zRotation = CGFloat(M_PI) * 1.5
        addChild(hitFish2)
        let aa = (SKAction.moveToY(self.frame.size.height * 0.7, duration: 2.5))
        let bb = SKAction.removeFromParent()
        hitFish2.runAction(SKAction.sequence([aa,bb]))
    }
    
    func  reduceTime() {
        reduce.position = CGPoint(x: frame.size.width * 0.1 , y: frame.size.height * 0.8)
        reduce.fontSize = 25
        reduce.fontName = "Courier"
        reduce.fontColor = UIColor.redColor()
        
        addChild(reduce)
        let aa = (SKAction.moveToY(self.frame.size.height * 0.3, duration: 3.0))
        let bb = SKAction.removeFromParent()
        reduce.runAction(SKAction.sequence([aa,bb]))
        
    }
    func  reduceTime1() {
        
        reduce1.position = CGPoint(x: frame.size.width * 0.1 , y: frame.size.height * 0.8)
        reduce1.fontSize = 25
        reduce1.fontName = "Courier"
        reduce1.fontColor = UIColor.redColor()
        addChild(reduce1)
        
        let aa = (SKAction.moveToY(self.frame.size.height * 0.3, duration: 3.0))
        let bb = SKAction.removeFromParent()
        reduce1.runAction(SKAction.sequence([aa,bb]))
        
    }
    
 }
