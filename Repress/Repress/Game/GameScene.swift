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
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self

        backgroundColor = SKColor.white
        
        start()
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main) {
            (data, error) in
            
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)! * 10), dy: CGFloat((data?.acceleration.y)! * 10))
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        
        if(bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1) {
            let alertInfo = ["message": "Congratulations", "title": "YOU WON", "buttonText": "Next level"]
            NotificationCenter.default.post(name: Notification.Name("AlertMessage"), object: nil, userInfo: alertInfo)
            //NotificationCenter.default.post(name: Notification.Name("Reset"), object: nil, userInfo: nil)
            
            // level ++
        }
        
        if(bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 3 || bodyA.categoryBitMask == 3 && bodyB.categoryBitMask == 1) {
            let alertInfo = ["message": "Try again", "title": "YOU LOST", "buttonText": "Start"]
            NotificationCenter.default.post(name: Notification.Name("AlertMessage"), object: nil, userInfo: alertInfo)
            //NotificationCenter.default.post(name: Notification.Name("Reset"), object: nil, userInfo: nil)
            clear()
            start()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
    
    
    func start() {
        if (level == 1) {
            let orange = UIColor(red:1.00, green:0.38, blue:0.00, alpha:1.0)
            let player = GameObject().createObject(imageName: "Bal_01", position: CGPoint(x: -320, y: -640), color: SKColor.red, size: CGSize(width: 100, height: 100), body: SKPhysicsBody(circleOfRadius: 50), gravity: true, dynamic: true, catMask: 1, fieldMask: 1, colMask: 2, conMask: 2)
            
            self.addChild(player)
            
            let finish = GameObject().createObject(imageName: "Finish_01", position: CGPoint(x: -325, y: 775), color: SKColor.blue, size: CGSize(width: 100, height: 100), body: SKPhysicsBody(circleOfRadius: 50), gravity: false, dynamic: false, catMask: 2, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(finish)
            
            let wall1 = GameObject().createObject(imageName: "null", position: CGPoint(x: -515, y: 0), color: orange, size: CGSize(width: 50, height: 1920), body: SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 1920)), gravity: false, dynamic: false, catMask: 4294967295, fieldMask: 4294967295, colMask: 4294967295, conMask: 0)
            
            self.addChild(wall1)
            
            let trap1 = GameObject().createObject(imageName: "Trap_01", position: CGPoint(x: 440, y: -530), color: SKColor.black, size: CGSize(width: 100, height: 100), body: SKPhysicsBody(circleOfRadius: 50), gravity: false, dynamic: false, catMask: 3, fieldMask: 1, colMask: 1, conMask: 1)
            
            self.addChild(trap1)
            
        }
    }
    
    func clear() {
        self.removeAllChildren()
        self.removeAllActions()
    }

}




