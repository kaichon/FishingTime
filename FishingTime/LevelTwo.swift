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
class LevelTwo: SKScene , SKPhysicsContactDelegate{
    
    var status = Setting()
    
    private var fish1 = Fish1()
    private var fish2 = Fish2()
    private var shoes = Shoes()
    private var cans = Cans()
    

    var timeOut = SKLabelNode(text: "0")
    var seconds = 0
    var timer = NSTimer()
    let bg = SKSpriteNode(imageNamed: "BGLavel2")
    var level = SKLabelNode(text: "level 2")
    
    var points1 = SKLabelNode(text: "0")
    var points2 = SKLabelNode(text: "0")
    var numPoints1 = 0
    var numPoints2 = 0
    var enemy = 0
    
    let fullscore = SKLabelNode(text: "/3")
    let fullscore2 = SKLabelNode(text: "/2")

    let btnclose = SKSpriteNode(imageNamed: "Close")
    
    let man = SKSpriteNode(imageNamed: "man")
    let hook = Control()
    let rope = SKSpriteNode(imageNamed: "rope")

    let agree = SKSpriteNode(imageNamed: "agree")
    let agree2 = SKSpriteNode(imageNamed: "agree")
    let pp = SKSpriteNode(imageNamed: "p")
    
    let hitFish1 = SKSpriteNode(imageNamed: "fish")
    let hitFish2 = SKSpriteNode(imageNamed: "chon")
    let hitShoes = SKSpriteNode(imageNamed: "shoe")
    let hitCans = SKSpriteNode(imageNamed: "can")

    var reduce = SKLabelNode(text: " - 10s ! ")
    var reduce1 = SKLabelNode(text: " - 10s ! ")
    
    var timeLevel2 = NSUserDefaults.standardUserDefaults()
    var scoreTime2 = 120
    

//    var reduce = SKLabelNode(text: " ลดเวลา 10 วินาที !! ")
//    var reduce1 = SKLabelNode(text: " ลดเวลา 10 วินาที !! ")
    
    
    override func didMoveToView(view: SKView)  {
        
        bg.position = CGPointMake(self.size.width / 2, self.size.height/2)
        bg.size.width = frame.size.width
        bg.size.height = frame.size.height
        addChild(bg)
        
        
        // ตำแหน่งการแสดงคะแนน ในหน้าจอ ------------------------------------------------------
        points1.position = CGPoint(x: frame.size.width * 0.88, y: frame.size.height * 0.93)
        points1.fontColor = UIColor.blackColor()
        points1.fontSize = 20
        points1.fontName = "Courier"
        addChild(points1)
        
        fullscore.position = CGPoint(x: frame.size.width * 0.91, y: frame.size.height * 0.93)
        fullscore.fontColor = UIColor.redColor()
        fullscore.fontSize = 20
        fullscore.fontName = "Courier"
        addChild(fullscore)
        
        // ตำแหน่งการแสดงคะแนน ในหน้าจอ
        points2.position = CGPoint(x: frame.size.width * 0.88, y: frame.size.height * 0.85)
        points2.fontColor = UIColor.blackColor()
        points2.fontSize = 20
        points2.fontName = "Courier"
        addChild(points2)
        
        
        fullscore2.position = CGPoint(x: frame.size.width * 0.91, y: frame.size.height * 0.85)
        fullscore2.fontColor = UIColor.redColor()
        fullscore2.fontSize = 20
        fullscore2.fontName = "Courier"
        addChild(fullscore2)
        
        //-----------------------------------------------------------------------------------
        
        //ButtonClose
        btnclose.position = CGPointMake(self.size.width * 0.97, self.size.height * 0.94)
        btnclose.size.width = size.width / 20
        btnclose.size.height = size.height / 12.5
        addChild(btnclose)
 
        
        level.position = CGPointMake(self.size.width / 2, self.size.height/2)
        level.fontSize = 30
        level.fontColor = UIColor.redColor()
        addChild(level)
        
        agree.position = CGPointMake(frame.size.width * 0.75, frame.size.height * 0.95)
        agree.size.width = size.width / 20
        agree.size.height = size.height / 20
        
        agree2.position = CGPointMake(frame.size.width * 0.72, frame.size.height * 0.86)
        agree2.size.width = size.width / 20
        agree2.size.height = size.height / 20
        
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
        
        fish2.position=CGPoint(x: frame.size.width * 1 , y: frame.size.height * 0.1)
        addChild(fish2)
        
        
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
        
        pp.position = CGPointMake(self.size.width * 0.52, self.size.height * 0.99)
        pp.size.width = size.width / 4
        pp.size.height = size.height / 15
        addChild(pp)
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        
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

        if (timeLevel2.valueForKey("scoreTime2") != nil){
            scoreTime2 = timeLevel2.valueForKey("scoreTime2") as! Int!
            print("ScoreTime ",     "\(scoreTime2)")
        }

        
    }
    
    func setupGame()  {
        seconds = 5
        timeOut.text = "\(seconds)" //แสดงค่าเริ่มต้น
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
        
    }
    
    func subtractTime() {
        seconds--
        timeOut.text = "\(seconds)"  //แสดงตอนเวลานับถอยหลัง
        
        if(seconds <= 0)  {
            timer.invalidate()
            let Scene = GameOver(size: self.size)
            let transition = SKTransition.fadeWithDuration(0)
            self.scene!.view?.presentScene(Scene, transition: transition)

        }else if(seconds <= 115)  {
            level.removeFromParent()
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
    
//    func hookMoveDown(){
//        
//        hook.runAction(SKAction.moveToY(self.frame.size.height * 0.02, duration: 5.0))
//        rope.runAction(SKAction.moveToY(self.frame.size.height * 0.54, duration: 5.0))
//        
//    }
//    func hookMoveUp(){
//        
//        hook.runAction(SKAction.moveToY(self.frame.size.height * 0.9, duration: 4.0))
//        rope.runAction(SKAction.moveToY(self.frame.size.height * 1.42, duration: 4.0))
//    }
//

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
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        let a: SKPhysicsBody = contact.bodyA
        let b: SKPhysicsBody = contact.bodyB
        
        print("a:",a.categoryBitMask,"b:",b.categoryBitMask)
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == Fish1Category){
            print("Fish1")
            hitFish_1()
            fish1.removeAllChildren()
            hookMoveUp()
    
            if status.soundStatus == 0 {
                runAction(SKAction.playSoundFileNamed("click.WAV", waitForCompletion: false))
            }
            
            if(numPoints1 <= 2){
                numPoints1 += 1
                points1.text = "\(numPoints1)"
                if(numPoints1 == 3 ){
                    points1.fontColor = UIColor.redColor()
                    addChild(agree)
                    
                }
            }

            }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == Fish2Category){
            print("Fish2")
            hitFish_2()
            fish2.removeAllChildren()
            hookMoveUp()
            if status.soundStatus == 0 {
                runAction(SKAction.playSoundFileNamed("click.WAV", waitForCompletion: false))
            }
            
            if(numPoints2 <= 1){
                numPoints2 += 1
                points2.text = "\(numPoints2)"
                if(numPoints2 == 2 ){
                    points2.fontColor = UIColor.redColor()
                    addChild(agree2)
                    
                }
            }
        }
        
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == ShoesCategory){
            print("Shoes")
            enemy += 10
            seconds -= 10
            shoes.removeAllChildren()
            hookMoveUp()
            hitShoe()
            reduceTime()
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        
        if(a.categoryBitMask == HookCategory && b.categoryBitMask == CansCategory){
            print("Can")
            enemy += 10
            seconds -= 10
            cans.removeAllChildren()
            hookMoveUp()
            hitCan()
            reduceTime1()
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        if((numPoints1 == 3) && (numPoints2 == 2)){
            var ss = 0
            ss = 120 - seconds
            ss -= enemy
            print("time  ",ss)
            scoreTime2 = ss
            scoreTime1()

            let Scene = ScoreLevel2(size: self.size)
            let transition = SKTransition.fadeWithDuration(2)
            self.scene!.view?.presentScene(Scene, transition: transition)
        }

    }

    
    func hitFish_1(){
        
        hitFish1.position = CGPoint(x: frame.size.width * 0.52 , y: hook.position.y)
        hitFish1.size.width = 60
        hitFish1.size.height = 35
        hitFish1.zRotation = CGFloat(M_PI) * 1.5
        addChild(hitFish1)
        let aa = (SKAction.moveToY(self.frame.size.height * 0.7, duration: 2.3))
        let bb = SKAction.removeFromParent()
        hitFish1.runAction(SKAction.sequence([aa,bb]))
        
    }
    
    func hitFish_2(){
        
        hitFish2.position = CGPoint(x: frame.size.width * 0.52 , y: hook.position.y)
        hitFish2.size.width = 80
        hitFish2.size.height = 33
        hitFish2.zRotation = CGFloat(M_PI) * 1.5
        addChild(hitFish2)
        let aa = (SKAction.moveToY(self.frame.size.height * 0.7, duration: 2.3))
        let bb = SKAction.removeFromParent()
        hitFish2.runAction(SKAction.sequence([aa,bb]))
    }
    func hitShoe(){
        hitShoes.position = CGPoint(x: frame.size.width * 0.5 , y: hook.position.y)
        hitShoes.size.width = 50
        hitShoes.size.height = 35
        //hitShoes.zRotation = CGFloat(M_PI) * 1.5
        addChild(hitShoes)
        let aa = (SKAction.moveToY(self.frame.size.height * 0.7, duration: 2.3))
        let bb = SKAction.removeFromParent()
        hitShoes.runAction(SKAction.sequence([aa,bb]))
    }
    func hitCan(){
        hitCans.position = CGPoint(x: frame.size.width * 0.52 , y: hook.position.y)
        hitCans.size.width = 35
        hitCans.size.height = 45
        addChild(hitCans)
        let aa = (SKAction.moveToY(self.frame.size.height * 0.7, duration: 2.3))
        let bb = SKAction.removeFromParent()
        hitCans.runAction(SKAction.sequence([aa,bb]))
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
    
    func scoreTime1(){  //การ save ค่า (การจดจำค่า)
        timeLevel2.setValue(scoreTime2, forKey: "scoreTime2")
        timeLevel2.synchronize()
        print("ScoreLevel \(scoreTime2)")
    }

    
}