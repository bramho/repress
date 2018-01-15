//
//  GameViewController.swift
//  Mazegame
//
//  Created by Grond, H. on 13/12/2017.
//  Copyright © 2017 MTNW07-17. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    //    var manager : ShoeManager!
    
    var leftShoe: Shoe!
    var rightShoe: Shoe!
    
    var game = GameScene()
    
    var i = 0
    
    var skView : SKView!
    
    //    func stateUpdated(_ state: Int, _ error: String?) {
    //        print("State: " + String(state))
    //        print(error as Any)
    //
    //        if (state == StateManager.States.activated.rawValue) {
    //            manager.stopConnectionSession()
    //        }
    //    }
    
    //    func sensorDataReceivedFromShoe(_ data: Shoe) {
    //        if(data.getShoeType() == 1)  { // leftShoe
    //            print("leftshoedata")
    //            print(data.getShoe().getSensors())
    //            self.leftShoe = data.getShoe()
    //        } else if (data.getShoeType() == 2) {
    //            print("rightshoedata")
    //            print(data.getShoe().getSensors())
    //            self.rightShoe = data.getShoe()
    //        }
    //
    //        if (leftShoe != nil && rightShoe != nil) {
    //            game.movePlayer(leftShoe: leftShoe, rightShoe: rightShoe)
    //        }
    //    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.AlertMessage(notification:)), name: Notification.Name("AlertMessage"), object: nil)
        game = GameScene(fileNamed:"GameScene")!
        //        manager = ShoeManager.init()
        //        manager.delegate = self
        //        StateManager.instance.delegate = self\
        
        if (game != nil) {
            // Configure the view.
            self.view = SKView()
            skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            game.scaleMode = .aspectFill
            
            skView.presentScene(game)
            
            
        }
        
    }
    
    @objc func AlertMessage(notification: NSNotification) {
        
        if self.viewIfLoaded?.window != nil {
            let alertInfo = notification.userInfo
            let message = alertInfo!["message"]
            let title = alertInfo!["title"]
            let buttonText = alertInfo!["buttonText"]
            
            let alert = UIAlertController(title: (title as! String), message: (message as! String), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: (buttonText as! String), style: UIAlertActionStyle.default){
                UIAlertAction in
                self.game.canMove = true})
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func tempActivationButton(_ sender: Any) {
        
        
    }
    func shouldAutorotate() -> Bool {
        return false
    }
    
    func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.game.canMove = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.game.canMove = false
        self.game.clear()
        self.game.start()
    }
}
