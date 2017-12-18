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
    
    var player = SKSpriteNode()
    var endNode = SKSpriteNode()

    var xValue : Double = 0
    var yValue : Double = 0
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: CGFloat(xValue),dy: CGFloat(yValue))
        print(self.physicsWorld.gravity)
        player = self.childNode(withName: "player") as! SKSpriteNode
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = true
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(self.execute), userInfo: nil, repeats: false)

    }
    
    @objc func execute() {
        //print("x: " + String(xValue) + " y: " + String(yValue))
        //xValue = 5
        self.physicsWorld.gravity = CGVector(dx: CGFloat(xValue), dy: CGFloat(yValue))
        print(self.physicsWorld.gravity)
    }

    func movePlayer(leftShoe: Shoe, rightShoe: Shoe){
        let leftSensors = leftShoe.getSensors()
        let rightSensors = rightShoe.getSensors()
        let sensor1total = leftSensors[0] + rightSensors[2]
        let sensor2total = leftSensors[1] + rightSensors[1]
        let sensor3total = leftSensors[2] + rightSensors[0]
        let sensor4total = leftSensors[3] + rightSensors[3]

//        if(sensor1total > sensor3total) {
//            xValue = 5
//        } else {
//            xValue = -5
//        }
//        if (sensor2total > sensor4total) {
//            yValue = 5
//        } else {
//            yValue = -5
//        }
        //world.gravity = CGVector(dx: xValue, dy: yValue)
        
        xValue = 5
        self.execute()

        //execute(xvalue: xValue, yValue: yValue)
        //print("x: " + String(xValue) + " y: " + String(yValue))
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




