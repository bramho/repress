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
    @IBOutlet weak var leftShoeSensorView1: UIView!
    @IBOutlet weak var leftShoeSensorView2: UIView!
    @IBOutlet weak var leftShoeSensorView3: UIView!
    @IBOutlet weak var leftShoeSensorView4: UIView!
    
    
    //Right Shoe
    @IBOutlet weak var rightShoeSensor4: UIImageView!
    @IBOutlet weak var rightShoeSensor3: UIImageView!
    @IBOutlet weak var rightShoeSensor2: UIImageView!
    @IBOutlet weak var rightShoeSensor1: UIImageView!
    @IBOutlet weak var rightShoeBlurSensor4: UIVisualEffectView!
    @IBOutlet weak var rightShoeBlurSensor3: UIVisualEffectView!
    @IBOutlet weak var rightShoeBlurSensor2: UIVisualEffectView!
    @IBOutlet weak var rightShoeBlurSensor1: UIVisualEffectView!
    @IBOutlet weak var rightShoeSensorView1: UIView!
    @IBOutlet weak var rightShoeSensorView2: UIView!
    @IBOutlet weak var rightShoeSensorView3: UIView!
    @IBOutlet weak var rightShoeSensorView4: UIView!
    
    
    @IBAction func fakerActivationButton(_ sender: Any) {
        patternFaker.scheduledTimerWithTimeInterval()
    }
    
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
        
      //  leftShoeSensor4.layer.cornerRadius = leftShoeSensor1.frame.width/2
      //  leftShoeSensor4.clipsToBounds = true//
        
        //patternFaker.scheduledTimerWithTimeInterval()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewShoeData(notification:)), name: Notification.Name("NewSensorData"), object: nil)
    }
    func stateUpdated(_ state: Int, _ error: String?) {
        print("State: " + String(state))
        print(error as Any)
        
        if (state == StateManager.States.activated.rawValue) {
            manager.stopConnectionSession()
        }
    }
    func sensorDataReceivedFromShoe(_ data: Shoe) {
        if(data.getShoeType() == 1)  { // leftShoe
            //print("leftshoedata")
            //print(data.getShoe().getSensors())
            let leftShoeData = data.getShoe()
            print("leftShoeData" + String(describing: leftShoeData))
            leftShoeSensorView1.backgroundColor = UIColor(hue: CGFloat(((1 - leftShoeData.getSensor1()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            leftShoeSensorView2.backgroundColor = UIColor(hue: CGFloat(((1 - leftShoeData.getSensor2()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            leftShoeSensorView3.backgroundColor = UIColor(hue: CGFloat(((1 - leftShoeData.getSensor3()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            leftShoeSensorView4.backgroundColor = UIColor(hue: CGFloat(((1 - leftShoeData.getSensor4()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)

        } else if (data.getShoeType() == 2) {
            let rightShoeData: Shoe = data.getShoe()
            //print("rightshoedata")
            //print(data.getShoe().getSensors())
        
            //print("sensor 1 Hue: " + String(describing: rightShoeSensor1.backgroundColor))
            rightShoeSensorView1.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor1()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            //rightShoeSensor1.alpha = CGFloat(Float(rightShoeData.getSensor1()))
            rightShoeSensorView2.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor2()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            //rightShoeSensor2.alpha = CGFloat(Float(rightShoeData.getSensor2()))
            rightShoeSensorView3.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor3()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            //rightShoeSensor3.alpha = CGFloat(Float(rightShoeData.getSensor3()))
            rightShoeSensorView4.backgroundColor = UIColor(hue: CGFloat(((1 - rightShoeData.getSensor4()) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
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
        
        displayValuesOnScreen(leftShoe: leftShoeData, rightShoe: rightShoeData)
        
    }
    
    func displayValuesOnScreen(leftShoe: SensorValue, rightShoe: SensorValue){
        leftShoeSensorView4.backgroundColor = UIColor(hue: CGFloat((((1 - leftShoe.sensor1 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
        leftShoeSensorView1.backgroundColor = UIColor(hue: CGFloat((((1 - leftShoe.sensor2 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
        leftShoeSensorView3.backgroundColor = UIColor(hue: CGFloat((((1 - leftShoe.sensor3 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
        leftShoeSensorView2.backgroundColor = UIColor(hue: CGFloat((((1 - leftShoe.sensor4 / 500)) / 6)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
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
