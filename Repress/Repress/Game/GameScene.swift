//
//  GameScene.swift
//  Mazegame
//
//  Created by Grond, H. on 13/12/2017.
//  Copyright © 2017 MTNW07-17. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    //var player = SKSpriteNode(imageNamed: "Cirkeltjes")
    // var endNode = SKSpriteNode()
    
    var level = 1
    var canMove = true
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self

        backgroundColor = SKColor.white
        
        start()
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main) {
            (data, error) in
        if(self.canMove){
                self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)! * 10), dy: CGFloat((data?.acceleration.y)! * 10))
        } else {
                self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        }
            
            //self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)! * 10), dy: CGFloat((data?.acceleration.y)! * 10))
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        
        if(bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1) {
            let alertInfo = ["message": "Congratulations", "title": "YOU WON", "buttonText": "Next level"]
            NotificationCenter.default.post(name: Notification.Name("AlertMessage"), object: nil, userInfo: alertInfo)
            //NotificationCenter.default.post(name: Notification.Name("Reset"), object: nil, userInfo: nil)
            clear()
            self.canMove = false
            start()
            // level ++
        }
        
        if(bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 3 || bodyA.categoryBitMask == 3 && bodyB.categoryBitMask == 1) {
            let alertInfo = ["message": "Try again", "title": "YOU LOST", "buttonText": "Start"]
            NotificationCenter.default.post(name: Notification.Name("AlertMessage"), object: nil, userInfo: alertInfo)
            //NotificationCenter.default.post(name: Notification.Name("Reset"), object: nil, userInfo: nil)
            clear()
            self.canMove = false
            start()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
    
    
    func start() {
        if (level == 1) {
            let orange = UIColor(red:1.00, green:0.38, blue:0.00, alpha:1.0)
            let player = GameObject().createObject(imageName: "Bal_01", position: CGPoint(x: -440, y: 585), color: SKColor.red, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: true, dynamic: true, catMask: 1, fieldMask: 1, colMask: 2, conMask: 2)
            
            self.addChild(player)
            
            let finish = GameObject().createObject(imageName: "Finish_01", position: CGPoint(x: 440, y: -590), color: SKColor.blue, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 2, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(finish)
            
            let wall1 = GameObject().createObject(imageName: "null", position: CGPoint(x: -530, y: 0), color: orange, size: CGSize(width: 20, height: 1340), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 1340)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall1)
            
            let wall2 = GameObject().createObject(imageName: "null", position: CGPoint(x: 0, y: 660), color: orange, size: CGSize(width: 1080, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 1080, height: 25)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall2)
            
            let wall3 = GameObject().createObject(imageName: "null", position: CGPoint(x: 530, y: 0), color: orange, size: CGSize(width: 20, height: 1340), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 1340)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall3)
            
            let wall4 = GameObject().createObject(imageName: "null", position: CGPoint(x: 0, y: -660), color: orange, size: CGSize(width: 1080, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 1080, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall4)
            
            let wall5 = GameObject().createObject(imageName: "null", position: CGPoint(x: -360, y: 360), color: orange, size: CGSize(width: 20, height: 600), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 600)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall5)
            
            let wall6 = GameObject().createObject(imageName: "null", position: CGPoint(x: -175, y: 280), color: orange, size: CGSize(width: 20, height: 600), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 600)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall6)
            
            let wall7 = GameObject().createObject(imageName: "null", position: CGPoint(x: -30, y: 460), color: orange, size: CGSize(width: 20, height: 180), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 180)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall7)
            
            let wall8 = GameObject().createObject(imageName: "null", position: CGPoint(x: 220, y: 360), color: orange, size: CGSize(width: 20, height: 180), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 180)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall8)
            
            let wall9 = GameObject().createObject(imageName: "null", position: CGPoint(x: 240, y: 550), color: orange, size: CGSize(width: 560, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 560, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall9)
            
            let wall10 = GameObject().createObject(imageName: "null", position: CGPoint(x: 110, y: 270), color: orange, size: CGSize(width: 580, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 580, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall10)
            
            let wall11 = GameObject().createObject(imageName: "null", position: CGPoint(x: -350, y: -10), color: orange, size: CGSize(width: 370, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 370, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall11)
            
            let wall12 = GameObject().createObject(imageName: "null", position: CGPoint(x: 240, y: -10), color: orange, size: CGSize(width: 600, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 600, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall12)
            
            let wall13 = GameObject().createObject(imageName: "null", position: CGPoint(x: -50, y: -140), color: orange, size: CGSize(width: 20, height: 270), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 270)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall13)
            
            let wall14 = GameObject().createObject(imageName: "null", position: CGPoint(x: -140, y: -140), color: orange, size: CGSize(width: 200, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall14)
            
            let wall15 = GameObject().createObject(imageName: "null", position: CGPoint(x: -360, y: -400), color: orange, size: CGSize(width: 20, height: 500), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 500)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall15)
            
            let wall16 = GameObject().createObject(imageName: "null", position: CGPoint(x: -270, y: -390), color: orange, size: CGSize(width: 200, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall16)
            
            let wall17 = GameObject().createObject(imageName: "null", position: CGPoint(x: -50, y: -520), color: orange, size: CGSize(width: 20, height: 260), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 260)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall17)
            
            let wall18 = GameObject().createObject(imageName: "null", position: CGPoint(x: 30, y: -390), color: orange, size: CGSize(width: 180, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 180, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall18)
            
            let wall19 = GameObject().createObject(imageName: "null", position: CGPoint(x: 110, y: -260), color: orange, size: CGSize(width: 20, height: 270), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 270)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall19)
            
            let wall20 = GameObject().createObject(imageName: "null", position: CGPoint(x: 240, y: -260), color: orange, size: CGSize(width: 20, height: 520), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 520)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall20)
            
            let wall21 = GameObject().createObject(imageName: "null", position: CGPoint(x: 150, y: -510), color: orange, size: CGSize(width: 170, height: 20), body: SKPhysicsBody(rectangleOf: CGSize(width: 170, height: 20)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall21)
            
            let wall22 = GameObject().createObject(imageName: "null", position: CGPoint(x: 370, y: -400), color: orange, size: CGSize(width: 20, height: 500), body: SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 500)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall22)
            
            let trap1 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -490, y: 290), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap1)
            
            let trap2 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -320, y: 130), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap2)
            
            let trap3 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -220, y: 400), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap3)
            
            let trap4 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 190, y: 585), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap4)
            
            let trap5 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -140, y: 305), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap5)
            
            let trap6 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 170, y: 305), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap6)
            
            let trap7 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 375, y: 305), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap7)
            
            let trap8 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 490, y: 510), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap8)
            
            let trap9 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 490, y: 160), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap9)
            
            let trap10 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 270, y: 110), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap10)
            
            let trap11 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 140, y: 230), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap11)
            
            let trap12 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 30, y: 25), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap12)
            
            let trap13 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -490, y: -590), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap13)
            
            let trap14 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -400, y: -355), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap14)
            
            let trap15 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -270, y: -305), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap15)
            
            let trap16 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -90, y: -180), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap16)
            
            let trap17 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -320, y: -590), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap17)
            
            let trap18 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -90, y: -590), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap18)
            
            let trap19 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 70, y: -355), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap19)
            
            let trap20 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 150, y: -155), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap20)
            
            let trap21 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: -10, y: -590), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap21)
            
            let trap22 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 280, y: -500), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap22)
            
            let trap23 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 330, y: -135), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap23)
            
            let trap24 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 425, y: -305), color: SKColor.black, size: CGSize(width: 50, height: 50), body: SKPhysicsBody(circleOfRadius: 25), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap24)
            
        }
    }
    
    func clear() {
        self.removeAllChildren()
        self.removeAllActions()
    }

}




