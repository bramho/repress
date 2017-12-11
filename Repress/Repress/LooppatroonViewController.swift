//
//  FirstViewController.swift
//  Repress
//
//  Created by Geart on 11/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import UIKit

class LooppatroonViewController: UIViewController {
    
    @IBOutlet weak var leftShoeSensor4: UIImageView!
    @IBOutlet weak var leftShoeSensor3: UIImageView!
    @IBOutlet weak var leftShoeSensor2: UIImageView!
    @IBOutlet weak var leftShoeSensor1: UIImageView!
    
    @IBOutlet weak var rightShoeSensor4: UIImageView!
    @IBOutlet weak var rightShoeSensor3: UIImageView!
    @IBOutlet weak var rightShoeSensor2: UIImageView!
    @IBOutlet weak var rightShoeSensor1: UIImageView!
    
    var patternFaker = PatternFaker()
    
    var leftSensorsInFloats: [Float] = [0.0,0.0,0.0,0.0]
    var rightSensorsInFloats: [Float] = [0.0,0.0,0.0,0.0]

    
    var sensorOutlets:[UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sensorOutlets = [leftShoeSensor1,leftShoeSensor2,leftShoeSensor3,leftShoeSensor4,rightShoeSensor1,rightShoeSensor2,rightShoeSensor3,rightShoeSensor4]
        // Do any additional setup after loading the view, typically from a nib.
        patternFaker.scheduledTimerWithTimeInterval()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewShoeData(notification:)), name: Notification.Name("NewSensorData"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func gotNewShoeData(notification: Notification) {
        let leftShoeData: SensorValue = notification.userInfo?["left_shoe"] as! SensorValue
        let rightShoeData: SensorValue = notification.userInfo?["right_shoe"] as! SensorValue
        
        displayValuesOnScreen(leftShoe: leftShoeData, rightShoe: rightShoeData)
        print("test")
        
    }
    func displayValuesOnScreen(leftShoe: SensorValue, rightShoe: SensorValue){
        
        leftShoeSensor1.alpha = CGFloat(ShoeDataNormalizer().normalizePressureValue(pressureValue: leftShoe.sensor1))
        leftShoeSensor2.alpha = CGFloat(ShoeDataNormalizer().normalizePressureValue(pressureValue: leftShoe.sensor2))
        leftShoeSensor3.alpha = CGFloat(ShoeDataNormalizer().normalizePressureValue(pressureValue: leftShoe.sensor3))
        leftShoeSensor4.alpha = CGFloat(ShoeDataNormalizer().normalizePressureValue(pressureValue: leftShoe.sensor4))
        
        rightShoeSensor1.alpha = CGFloat(ShoeDataNormalizer().normalizePressureValue(pressureValue: rightShoe.sensor1))
        rightShoeSensor2.alpha = CGFloat(ShoeDataNormalizer().normalizePressureValue(pressureValue: rightShoe.sensor2))
        rightShoeSensor3.alpha = CGFloat(ShoeDataNormalizer().normalizePressureValue(pressureValue: rightShoe.sensor3))
        rightShoeSensor4.alpha = CGFloat(ShoeDataNormalizer().normalizePressureValue(pressureValue: rightShoe.sensor4))
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
