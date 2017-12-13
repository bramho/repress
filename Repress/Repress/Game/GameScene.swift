//
//  GameScene.swift
//  Mazegame
//
//  Created by Grond, H. on 13/12/2017.
//  Copyright © 2017 MTNW07-17. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player = SKSpriteNode()
    var endNode = SKSpriteNode()

    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        //self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        player = self.childNode(withName: "player") as! SKSpriteNode
//        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(self.execute), userInfo: nil, repeats: true)
    }

    func movePlayer(leftShoe: Shoe, rightShoe: Shoe){
        let sensor1total = leftShoe.getSensor1() + rightShoe.getSensor3()
        let sensor2total = leftShoe.getSensor2() + rightShoe.getSensor2()
        let sensor3total = leftShoe.getSensor3() + rightShoe.getSensor1()
        let sensor4total = leftShoe.getSensor4() + rightShoe.getSensor4()
        
        print("1 " + String(leftShoe.getSensor1()) + " " + String(rightShoe.getSensor3()))
        print("2 " + String(leftShoe.getSensor2()) + " " + String(rightShoe.getSensor2()))
        print("3 " + String(leftShoe.getSensor3()) + " " + String(rightShoe.getSensor1()))
        print(" 4 " + String(leftShoe.getSensor4()) + " " + String(rightShoe.getSensor4()))
        
        
        let x = sensor1total - sensor3total
        let y = sensor2total - sensor4total
        
        //print("x: " + String(x))
        //print("y: " + String(y))
        
        self.physicsWorld.gravity = CGVector(dx: x * 10, dy: y * 10)
    }
    
    func didBeginConctact(contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if(bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1) {
            print("You won!")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}




