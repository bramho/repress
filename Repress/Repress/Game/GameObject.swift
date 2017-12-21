//
//  GameObject.swift
//  Repress
//
//  Created by Grond, H. on 21/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation
import SpriteKit

class GameObject {
    
    var object = SKSpriteNode()

    init() {
        
    }
    
    func createObject(imageName: String, position: CGPoint, color: SKColor, size: CGSize, body: SKPhysicsBody, gravity: Bool, dynamic: Bool, catMask: Int, fieldMask: Int, colMask: Int, conMask: Int) -> SKSpriteNode{
        if(imageName != "null") {
            object = SKSpriteNode(imageNamed: imageName)
        }
        object.position = position
        object.color = color
        object.size = size
        object.physicsBody = body
        object.physicsBody?.affectedByGravity = gravity
        object.physicsBody?.allowsRotation = false
        object.physicsBody?.isDynamic = dynamic
        object.physicsBody?.categoryBitMask = UInt32(catMask)
        object.physicsBody?.fieldBitMask = UInt32(fieldMask)
        object.physicsBody?.collisionBitMask = UInt32(colMask)
        object.physicsBody?.contactTestBitMask = UInt32(conMask)
        
        return object
    }
}
