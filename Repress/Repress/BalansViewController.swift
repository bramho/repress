//
//  SecondViewController.swift
//  Repress
//
//  Created by Geart on 11/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import UIKit

class BalansViewController: UIViewController, ShoeManagerDelegate, StateManagerDelegate {
    @IBOutlet weak var leftShoeBar: UIView!
    @IBOutlet weak var rightShoeBar: UIView!
    
    @IBOutlet weak var leftShoeLabel: UILabel!
    @IBOutlet weak var rightShoeLabel: UILabel!
    
    var manager : ShoeManager!
    var balanceFaker = BalanceFaker()
    
    var leftShoe: Shoe!
    var rightShoe: Shoe!
    
    @IBAction func tempStartButton(_ sender: Any) {
        manager.startConnectionSession()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        manager = ShoeManager.init()
//        manager.delegate = self
//        StateManager.instance.delegate = self
        
        // Start interval
        //balanceFaker.scheduledTimerWithTimeInterval()
        
        // Listen for new balance data
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewBalanceData(notification:)), name: Notification.Name("NewShoeData"), object: nil)
    }
    
    func stateUpdated(_ state: Int, _ error: String?) {
        print("State: " + String(state))
        print(error)
        
        if (state == StateManager.States.activated.rawValue) {
            manager.stopConnectionSession()
        }
    }
    
    func sensorDataReceivedFromShoe(_ data: Shoe) {
        if(data.getShoeType() == 1)  { // leftShoe
            print("leftshoedata")
            print(data.getShoe().getSensors())
            self.leftShoe = data.getShoe()
        } else if (data.getShoeType() == 2) {
            print("rightshoedata")
            print(data.getShoe().getSensors())
            self.rightShoe = data.getShoe()
        }
        
        if (leftShoe != nil && rightShoe != nil) {
            displayBalanceOnScreen()
        }
    }
    
    @objc func gotNewBalanceData(notification: Notification) {
        let leftShoeData: SensorValue = notification.userInfo?["left_shoe"] as! SensorValue
        let rightShoeData: SensorValue = notification.userInfo?["right_shoe"] as! SensorValue
        
<<<<<<< HEAD
//        displayBalanceOnScreen(leftShoe: leftShoeData, rightShoe: rightShoeData)
=======
        //displayBalanceOnScreen(leftShoe: leftShoeData, rightShoe: rightShoeData)
>>>>>>> origin/develop
    }
    
    // Display balance data on the screen
    func displayBalanceOnScreen() {
        let leftShoeTotal = leftShoe.getSensor1() + leftShoe.getSensor2() + leftShoe.getSensor3() + leftShoe.getSensor4()
        let rightShoeTotal = rightShoe.getSensor1() + rightShoe.getSensor2() + rightShoe.getSensor3() + rightShoe.getSensor4()
        let overallTotal = leftShoeTotal + rightShoeTotal
        
        let leftShoePercentage = Int((leftShoeTotal / overallTotal) * 100)
        let rightShoePercentage = Int((rightShoeTotal / overallTotal) * 100)
        
        leftShoeLabel.text = String(leftShoePercentage) + "%"
        rightShoeLabel.text = String(rightShoePercentage) + "%"
        
        let leftShoeBarHeight = Int(300 * (leftShoeTotal / overallTotal))
        let rightShoeBarHeight = Int(300 * (rightShoeTotal / overallTotal))
        
        leftShoeBar.frame = CGRect(x: 16, y: (557 - leftShoeBarHeight), width: 100, height: leftShoeBarHeight)
        rightShoeBar.frame = CGRect(x: 259, y: (557 - rightShoeBarHeight), width: 100, height: rightShoeBarHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        balanceFaker.repeats = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        balanceFaker.repeats = false
    }
}

