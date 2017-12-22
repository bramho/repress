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
    
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: SmallBlueLabel!
    
    var manager : ShoeManager!
    var currentState: Int!
    
    var balanceFaker = BalanceFaker()
    var balanceFakerIsRunning: Bool = false
    
    var leftShoe: Shoe!
    var rightShoe: Shoe!
    
    @IBOutlet weak var balanceButton: OrangeButton!
    
    @IBAction func balanceButton(_ sender: Any) {
        if (!balanceFakerIsRunning) {
            if (currentState == StateManager.States.activating.rawValue) {
                manager.stopConnectionSession()
                balanceButton.setTitle("Start meten", for: .normal)
            } else if (currentState == StateManager.States.connected.rawValue || currentState == StateManager.States.stopped.rawValue || currentState == StateManager.States.completed.rawValue) {
                // Start shoe connection
                manager.startConnectionSession()
                balanceButton.setTitle("Stop met verbinden", for: .normal)
            } else if (currentState == StateManager.States.activated.rawValue) {
                balanceButton.setTitle("Start meten", for: .normal)
            }
        }
    }
    
    @IBOutlet weak var demoButton: WhiteButton!
    
    @IBAction func demoButton(_ sender: Any) {        
        if (currentState != StateManager.States.activating.rawValue && currentState != StateManager.States.activated.rawValue && currentState != StateManager.States.initialized.rawValue && currentState != StateManager.States.verified.rawValue) && currentState != StateManager.States.starting.rawValue {
            if (balanceFakerIsRunning) {
                // Stop interval
                balanceFakerIsRunning = false
                balanceFaker.clearTimer()
                resetBalanceScreen()
                demoButton.setTitle("Start demo", for: .normal)
            } else {
                // Start balance faker
                balanceFakerIsRunning = true
                balanceFaker.scheduledTimerWithTimeInterval()
                demoButton.setTitle("Stop demo", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = ShoeManager.init()
        manager.delegate = self
        StateManager.instance.delegate = self

        loadingActivityIndicator.hidesWhenStopped = true
        
        // Listen for new balance data
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewBalanceData(notification:)), name: Notification.Name("NewShoeData"), object: nil)
    }
    
    func stateUpdated(_ state: Int, _ error: String?) {
        print("State: " + String(state))
        currentState = state
        print(error)
        
        if (state == StateManager.States.starting.rawValue) {
            loadingActivityIndicator.startAnimating()
            loadingLabel.text = "Aan het verbinden met de schoenen..."
        }
        
        if (state == StateManager.States.connected.rawValue) {
            balanceButton.setTitle("Start meten", for: .normal)
            resetBalanceScreen()
        }
        
        if (state == StateManager.States.activated.rawValue) {
            balanceButton.setTitle("Stop meten", for: .normal)
            manager.stopConnectionSession()
        }
        
        if (state == StateManager.States.completed.rawValue || state == StateManager.States.activated.rawValue || state == StateManager.States.disconnected.rawValue || state == StateManager.States.stopped.rawValue) {
            loadingActivityIndicator.stopAnimating()
            loadingLabel.text = ""
        }
    }
    
    func sensorDataReceivedFromShoe(_ data: Shoe) {
        if(data.getShoeType() == 1)  {
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
//        let leftShoeData: SensorValue = notification.userInfo?["left_shoe"] as! SensorValue
//        let rightShoeData: SensorValue = notification.userInfo?["right_shoe"] as! SensorValue
        
        leftShoe = notification.userInfo?["left_shoe"] as! Shoe
        rightShoe = notification.userInfo?["right_shoe"] as! Shoe
        
        displayBalanceOnScreen()
    }
    
    // Display balance data on the screen
    func displayBalanceOnScreen() {
        let leftShoeTotal = leftShoe.getSensor1() + leftShoe.getSensor2() + leftShoe.getSensor3() + leftShoe.getSensor4()
        let rightShoeTotal = rightShoe.getSensor1() + rightShoe.getSensor2() + rightShoe.getSensor3() + rightShoe.getSensor4()
        let overallTotal = leftShoeTotal + rightShoeTotal
        
        if (leftShoeTotal != 0.0 && rightShoeTotal != 0.0) {
            let leftShoePercentage = Int((leftShoeTotal / overallTotal) * 100)
            let rightShoePercentage = Int((rightShoeTotal / overallTotal) * 100)
            
            leftShoeLabel.text = String(leftShoePercentage) + "%"
            rightShoeLabel.text = String(rightShoePercentage) + "%"
            
            let leftShoeBarHeight = Int(300 * (leftShoeTotal / overallTotal))
            let rightShoeBarHeight = Int(300 * (rightShoeTotal / overallTotal))
            
            leftShoeBar.frame = CGRect(x: 85, y: (700 - leftShoeBarHeight), width: 100, height: leftShoeBarHeight)
            rightShoeBar.frame = CGRect(x: 548, y: (700 - rightShoeBarHeight), width: 100, height: rightShoeBarHeight)
        }
    }
    
    func resetBalanceScreen() {
        leftShoeBar.frame = CGRect(x: 85, y: 700, width: 100, height: 0)
        rightShoeBar.frame = CGRect(x: 548, y: 700, width: 100, height: 0)
        leftShoeLabel.text = "0%"
        rightShoeLabel.text = "0%"
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

