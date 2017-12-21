//
//  FirstViewController.swift
//  Repress
//
//  Created by Geart on 11/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import UIKit

class LooppatroonViewController: UIViewController, ShoeManagerDelegate, StateManagerDelegate {
    
    //Left Shoe
    @IBOutlet weak var leftShoeSensor4: UIImageView!
    @IBOutlet weak var leftShoeSensor3: UIImageView!
    @IBOutlet weak var leftShoeSensor2: UIImageView!
    @IBOutlet weak var leftShoeSensor1: UIImageView!
    
    //Right Shoe
    @IBOutlet weak var rightShoeSensor4: UIImageView!
    @IBOutlet weak var rightShoeSensor3: UIImageView!
    @IBOutlet weak var rightShoeSensor2: UIImageView!
    @IBOutlet weak var rightShoeSensor1: UIImageView!
    
    var patternFakerIsRunning: Bool = false
    
    var currentState: Int!
    
    @IBOutlet weak var demoButton: WhiteButton!
    @IBAction func demoButton(_ sender: Any) {
        if (currentState != StateManager.States.activating.rawValue && currentState != StateManager.States.activated.rawValue && currentState != StateManager.States.initialized.rawValue && currentState != StateManager.States.verified.rawValue) && currentState != StateManager.States.starting.rawValue {
            if (patternFakerIsRunning) {
                // Stop interval
                patternFakerIsRunning = false
                patternFaker.clearTimer()
                resetPatternScreen()
                demoButton.setTitle("Start demo", for: .normal)
            } else {
                // Start balance faker
                patternFakerIsRunning = true
                patternFaker.scheduledTimerWithTimeInterval()
                demoButton.setTitle("Stop demo", for: .normal)
            }
        }
    }
    
    @IBOutlet weak var looppatroonButton: OrangeButton!
    @IBAction func looppatroonButton(_ sender: Any) {
        if (!patternFakerIsRunning) {
            if (currentState == StateManager.States.activating.rawValue) {
                manager.stopConnectionSession()
                looppatroonButton.setTitle("Start meten", for: .normal)
            } else if (currentState == StateManager.States.connected.rawValue || currentState == StateManager.States.stopped.rawValue || currentState == StateManager.States.completed.rawValue) {
                // Start shoe connection
                manager.startConnectionSession()
                looppatroonButton.setTitle("Stop met verbinden", for: .normal)
            } else if (currentState == StateManager.States.activated.rawValue) {
                looppatroonButton.setTitle("Start meten", for: .normal)
            }
        }
    }
    var patternFaker = PatternFaker()
    var manager : ShoeManager!
    
    var leftSensorsInFloats: [Float] = [0.0,0.0,0.0,0.0]
    var rightSensorsInFloats: [Float] = [0.0,0.0,0.0,0.0]

    var leftShoe: Shoe!
    var rightShoe: Shoe!
    
    var sensorOutlets:[UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager = ShoeManager.init()
        manager.delegate = self
        StateManager.instance.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewShoeData(notification:)), name: Notification.Name("NewSensorData"), object: nil)
    }
    func stateUpdated(_ state: Int, _ error: String?) {
        currentState = state
        print("State: " + String(state))
        print(error as Any)
        
        if (state == StateManager.States.activated.rawValue) {
            manager.stopConnectionSession()
        }
    }
    func sensorDataReceivedFromShoe(_ data: Shoe) {
        if(data.getShoeType() == 1)  {
            // leftShoe
            let leftShoeData = data.getShoe()
            print("leftShoeData" + String(describing: leftShoeData))
            leftShoeSensor1.backgroundColor = UIColor(hue: CGFloat(((1 - leftShoeData.getSensor1()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 0.8)
            leftShoeSensor2.backgroundColor = UIColor(hue: CGFloat(((1 - leftShoeData.getSensor2()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 0.8)
            leftShoeSensor3.backgroundColor = UIColor(hue: CGFloat(((1 - leftShoeData.getSensor3()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 0.8)
            leftShoeSensor4.backgroundColor = UIColor(hue: CGFloat(((1 - leftShoeData.getSensor4()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 0.8)

        } else if (data.getShoeType() == 2) {
            //rightShoe
            let rightShoeData: Shoe = data.getShoe()
            rightShoeSensor1.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor1()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 0.8)
            rightShoeSensor2.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor2()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 0.8)
            rightShoeSensor3.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor3()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 0.8)
            rightShoeSensor4.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor4()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 0.8)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func gotNewShoeData(notification: Notification) {
        let leftShoeData: SensorValue = notification.userInfo?["left_shoe"] as! SensorValue
        let rightShoeData: SensorValue = notification.userInfo?["right_shoe"] as! SensorValue
        
        displayValuesOnScreen(leftShoe: leftShoeData, rightShoe: rightShoeData)
        
    }
    
    func displayValuesOnScreen(leftShoe: SensorValue, rightShoe: SensorValue){
        leftShoeSensor4.backgroundColor = UIColor(hue: CGFloat((((1 - leftShoe.sensor1 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1)
        leftShoeSensor1.backgroundColor = UIColor(hue: CGFloat((((1 - leftShoe.sensor2 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1)
        leftShoeSensor3.backgroundColor = UIColor(hue: CGFloat((((1 - leftShoe.sensor3 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1)
        leftShoeSensor2.backgroundColor = UIColor(hue: CGFloat((((1 - leftShoe.sensor4 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1)
        
        rightShoeSensor4.backgroundColor = UIColor(hue: CGFloat((((1 - rightShoe.sensor1 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1)
        rightShoeSensor1.backgroundColor = UIColor(hue: CGFloat((((1 - rightShoe.sensor2 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1)
        rightShoeSensor3.backgroundColor = UIColor(hue: CGFloat((((1 - rightShoe.sensor3 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1)
        rightShoeSensor2.backgroundColor = UIColor(hue: CGFloat((((1 - rightShoe.sensor4 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1)
    }
    
    func resetPatternScreen(){
        leftShoeSensor4.backgroundColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1)
        leftShoeSensor1.backgroundColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1)
        leftShoeSensor3.backgroundColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1)
        leftShoeSensor2.backgroundColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1)
        
        rightShoeSensor4.backgroundColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1)
        rightShoeSensor1.backgroundColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1)
        rightShoeSensor3.backgroundColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1)
        rightShoeSensor2.backgroundColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1)
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
