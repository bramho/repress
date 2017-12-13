//
//  FirstViewController.swift
//  Repress
//
//  Created by Geart on 11/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import UIKit

class LooppatroonViewController: UIViewController, ShoeManagerDelegate, StateManagerDelegate {
    
    @IBOutlet weak var leftShoeSensor4: UIImageView!
    @IBOutlet weak var leftShoeSensor3: UIImageView!
    @IBOutlet weak var leftShoeSensor2: UIImageView!
    @IBOutlet weak var leftShoeSensor1: UIImageView!
    
    @IBOutlet weak var rightShoeSensor4: UIImageView!
    @IBOutlet weak var rightShoeSensor3: UIImageView!
    @IBOutlet weak var rightShoeSensor2: UIImageView!
    @IBOutlet weak var rightShoeSensor1: UIImageView!
    
    @IBAction func tempActivationButton(_ sender: Any) {
        manager.startConnectionSession()
    }
    var patternFaker = PatternFaker()
    var manager : ShoeManager!
    
    var leftSensorsInFloats: [Float] = [0.0,0.0,0.0,0.0]
    var rightSensorsInFloats: [Float] = [0.0,0.0,0.0,0.0]

    var leftShoe: Shoe!
    var rightShoe: Shoe!
    
    var sensorOutlets:[UIView] = []
    
    //var newBackgroundColor: UIColor = (hue: 0.0, saturation: 0.5, brightness: 0.5, alpha: 0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = ShoeManager.init()
        manager.delegate = self
        StateManager.instance.delegate = self
        
        
        sensorOutlets = [leftShoeSensor1,leftShoeSensor2,leftShoeSensor3,leftShoeSensor4,rightShoeSensor1,rightShoeSensor2,rightShoeSensor3,rightShoeSensor4]
        // Do any additional setup after loading the view, typically from a nib.
        //patternFaker.scheduledTimerWithTimeInterval()
        
        //NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewShoeData(notification:)), name: Notification.Name("NewSensorData"), object: nil)
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
            //print("leftshoedata")
            //print(data.getShoe().getSensors())
            var leftShoeData = data.getShoe()
            print("leftShoeData" + String(describing: leftShoeData))
            leftShoeSensor1.alpha = CGFloat(Float(leftShoeData.getSensor1()))
            leftShoeSensor2.alpha = CGFloat(Float(leftShoeData.getSensor2()))
            leftShoeSensor3.alpha = CGFloat(Float(leftShoeData.getSensor3()))
            leftShoeSensor4.alpha = CGFloat(Float(leftShoeData.getSensor4()))
        } else if (data.getShoeType() == 2) {
            var rightShoeData: Shoe = data.getShoe()
            //print("rightshoedata")
            //print(data.getShoe().getSensors())
        
            //print("sensor 1 Hue: " + String(describing: rightShoeSensor1.backgroundColor))
            rightShoeSensor1.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor1()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            //rightShoeSensor1.alpha = CGFloat(Float(rightShoeData.getSensor1()))
            rightShoeSensor2.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor2()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            //rightShoeSensor2.alpha = CGFloat(Float(rightShoeData.getSensor2()))
            rightShoeSensor3.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor3()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            //rightShoeSensor3.alpha = CGFloat(Float(rightShoeData.getSensor3()))
            rightShoeSensor4.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor4()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            //rightShoeSensor4.alpha = CGFloat(Float(rightShoeData.getSensor4()))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func gotNewShoeData(notification: Notification) {
        let leftShoeData: SensorValue = notification.userInfo?["left_shoe"] as! SensorValue
        let rightShoeData: SensorValue = notification.userInfo?["right_shoe"] as! SensorValue
        
        //displayValuesOnScreen(leftShoe: Shoe, rightShoe: Shoe)
        print("test")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        patternFaker.repeats = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        patternFaker.repeats = false
    }
}
