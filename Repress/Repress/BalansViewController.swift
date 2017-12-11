//
//  SecondViewController.swift
//  Repress
//
//  Created by Geart on 11/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import UIKit

class BalansViewController: UIViewController {

    @IBOutlet weak var leftShoeBar: UIView!
    @IBOutlet weak var rightShoeBar: UIView!
    
    @IBOutlet weak var leftShoeLabel: UILabel!
    @IBOutlet weak var rightShoeLabel: UILabel!
    
    var balanceFaker = BalanceFaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start interval
        balanceFaker.scheduledTimerWithTimeInterval()
        
        // Listen for new balance data
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewBalanceData(notification:)), name: Notification.Name("NewShoeData"), object: nil)
    }
    
    @objc func gotNewBalanceData(notification: Notification) {
        let leftShoeData: SensorValue = notification.userInfo?["left_shoe"] as! SensorValue
        let rightShoeData: SensorValue = notification.userInfo?["right_shoe"] as! SensorValue
        
        displayBalanceOnScreen(leftShoe: leftShoeData, rightShoe: rightShoeData)
    }
    
    // Display balance data on the screen
    func displayBalanceOnScreen(leftShoe: SensorValue, rightShoe: SensorValue) {
        let leftShoeTotal = leftShoe.sensor1 + leftShoe.sensor2 + leftShoe.sensor3 + leftShoe.sensor4
        let rightShoeTotal = rightShoe.sensor1 + rightShoe.sensor2 + rightShoe.sensor3 + rightShoe.sensor4
        let overallTotal = leftShoeTotal + rightShoeTotal
        
        let leftShoePercentage = Int((leftShoeTotal / overallTotal) * 100)
        let rightShoePercentage = Int((rightShoeTotal / overallTotal) * 100)
        
        leftShoeLabel.text = String(leftShoePercentage) + "%"
        rightShoeLabel.text = String(rightShoePercentage) + "%"
        
        let leftShoeBarHeight = Int(500 * (leftShoeTotal / overallTotal))
        let rightShoeBarHeight = Int(500 * (rightShoeTotal / overallTotal))
        
        leftShoeBar.frame = CGRect(x: 97, y: (919 - leftShoeBarHeight), width: 100, height: leftShoeBarHeight)
        rightShoeBar.frame = CGRect(x: 585, y: (919 - rightShoeBarHeight), width: 100, height: rightShoeBarHeight)
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

