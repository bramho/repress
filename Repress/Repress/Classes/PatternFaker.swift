//
//  File.swift
//  ShoeFaker
//
//  Created by Geart on 11/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation
import UIKit

class PatternFaker{
    
    
    var leftFootSensors : [Int] = [0, 0, 0, 0]
    var leftSensorsInFloats: [Float] = [0,0,0,0]
    
    var rightFootSensors : [Int] = [0, 0, 0, 0]
    var rightSensorsInFloats: [Float] = [0,0,0,0]
    
    var fase : Int = 0
    var sensor : Int = 0
    
    var timer = Timer()
    var liftLeftFoot = LiftFoot.init()
    var liftRightFoot = LiftFoot.init()
    var repeats: Bool = true
    
    // Starts interval
    func scheduledTimerWithTimeInterval () {
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.generateShoeValues), userInfo: nil, repeats: true)
    }
    
    @objc func generateShoeValues () {
        if repeats{
            let leftShoeValues = SensorValue(sensor1: Float(leftFootSensors[0]), sensor2: Float(leftFootSensors[1]), sensor3: Float(leftFootSensors[2]), sensor4: Float(leftFootSensors[3]))
            
            let rightShoeValues = SensorValue(sensor1: Float(rightFootSensors[0]), sensor2: Float(rightFootSensors[1]), sensor3: Float(rightFootSensors[2]), sensor4: Float(rightFootSensors[3]))
            
            let sensorValues: [String: SensorValue] = ["left_shoe": leftShoeValues, "right_shoe": rightShoeValues]
            //print (fase)
            // Posts sensor data to NotificationCenter
            NotificationCenter.default.post(name: Notification.Name("NewSensorData"), object: nil, userInfo: sensorValues)
            //print(NotificationCenter.default.post(name: Notification.Name("NewSensorData1"), object: nil, userInfo: sensorValues))
            count()
        }
        
    }
    func count() {
        //Set foot down
        //Heel step
        if fase == 0 {
            getValues(sensor: sensor, fase: fase)
            sensor += Int.random(range: 35...45)
            if sensor > 500 {
                nextFase()
            }
            //Mid step
        } else if fase == 1 {
            getValues(sensor: sensor, fase: fase)
            sensor -= Int.random(range: 35...45)
            if sensor < 250 {
                nextFase()
                sensor = 0
            }
            //Toe step
        } else if fase == 2 {
            getValues(sensor: sensor, fase: fase)
            sensor += Int.random(range: 35...45)
            if sensor > 500 {
                nextFase()
            }
            //Lift foot
        } else {
            getValues(sensor: sensor, fase: fase)
            sensor -= Int.random(range: 35...45)
            if sensor < 250 {
                nextFase()
                sensor = 0
            }
        }
    }
    
    func nextFase() {
        if fase == 3 {
            fase = 0
        } else {
            fase += 1
        }
    }
    
    func getValues (sensor: Int, fase: Int){
        if fase == 0 || fase == 1 {
            if fase == 0 {
                if sensor < 40 {
                    leftFootSensors = [sensor, Int.random(range: 30...50), Int.random(range: 30...50), Int.random(range: 0...30)]
                    rightFootSensors = [0, Int.random(range: 195...205), Int.random(range: 195...205), Int.random(range: 210...220)]
                } else if sensor < 80 {
                    leftFootSensors = [sensor, Int.random(range: 30...50), Int.random(range: 30...50), Int.random(range:25...30)]
                    rightFootSensors = [0, Int.random(range: 175...185), Int.random(range: 170...180), Int.random(range: 230...240)]
                } else if sensor < 120 {
                    leftFootSensors = [sensor, Int.random(range: 30...50), Int.random(range: 30...50), Int.random(range: 25...30)]
                    rightFootSensors = [0, Int.random(range: 155...165), Int.random(range: 145...155), Int.random(range: 250...260)]
                } else if sensor < 160{
                    leftFootSensors = [sensor, Int.random(range: 50...80), Int.random(range: 50...80), Int.random(range: 30...40)]
                    rightFootSensors = [0, Int.random(range: 135...145), Int.random(range: 120...130), Int.random(range: 270...280)]
                } else if sensor < 200{
                    leftFootSensors = [sensor, Int.random(range: 80...100), Int.random(range: 80...100), Int.random(range: 40...50)]
                    rightFootSensors = [0, Int.random(range: 115...125), Int.random(range: 95...105), Int.random(range: 290...300)]
                } else if sensor < 240 {
                    leftFootSensors = [sensor, Int.random(range: 100...110), Int.random(range: 100...110), Int.random(range: 40...50)]
                    rightFootSensors = [0, Int.random(range: 95...105), Int.random(range: 70...80), 500 - sensor]
                } else if sensor < 280{
                    leftFootSensors = [sensor, Int.random(range: 110...120), Int.random(range: 110...120), Int.random(range: 40...50)]
                    rightFootSensors = [0, Int.random(range: 75...85), Int.random(range: 55...65), 500 - sensor]
                } else if sensor < 320 {
                    leftFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    rightFootSensors = [0, Int.random(range: 55...65), Int.random(range: 30...40), 500 - sensor]
                } else if sensor < 360 {
                    leftFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    rightFootSensors = [0, Int.random(range: 25...35), Int.random(range: 5...15), 500 - sensor]
                } else if sensor < 400 {
                    leftFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    rightFootSensors = [0, Int.random(range: 5...15), Int.random(range: 5...15), 500 - sensor]
                } else if sensor < 440 {
                    leftFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    rightFootSensors = [0, Int.random(range: 5...15), Int.random(range: 5...15), 500 - sensor]
                } else if sensor < 480 {
                    leftFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    rightFootSensors = [0, Int.random(range: 5...15), Int.random(range: 5...15), 500 - sensor]
                }
            }
            if fase == 1 {
                if sensor < 400{
                    leftFootSensors = [sensor, Int.random(range: 200...210), Int.random(range: 200...210), Int.random(range: 30...40)]
                    rightFootSensors = [0, 0, 0, 0]
                } else if sensor < 360 {
                    leftFootSensors = [sensor, Int.random(range: 230...230), Int.random(range: 230...230), Int.random(range: 70...80)]
                    rightFootSensors = [0, 0, 0, 0]
                } else if sensor < 320 {
                    leftFootSensors = [sensor, Int.random(range: 260...260), Int.random(range: 260...260), Int.random(range: 110...120)]
                    rightFootSensors = [0, 0, 0, 0]
                } else if sensor < 280 {
                    leftFootSensors = [sensor, Int.random(range: 280...280), Int.random(range: 280...280), Int.random(range: 150...160)]
                    rightFootSensors = [0, 0, 0, 0]
                } else if sensor < 240 {
                    leftFootSensors = [sensor, Int.random(range: 300...300), Int.random(range: 300...300), Int.random(range: 190...200)]
                    rightFootSensors = [0, 0, 0, 0]
                }
            }
        } else {
            if fase == 2 {
                if sensor < 40 {
                    rightFootSensors = [sensor, Int.random(range: 30...50), Int.random(range: 30...50), Int.random(range: 0...30)]
                    leftFootSensors = [0, Int.random(range: 195...205), Int.random(range: 195...205), Int.random(range: 210...220)]
                } else if sensor < 80 {
                    rightFootSensors = [sensor, Int.random(range: 30...50), Int.random(range: 30...50), Int.random(range:25...30)]
                    leftFootSensors = [0, Int.random(range: 175...185), Int.random(range: 170...180), Int.random(range: 230...240)]
                } else if sensor < 120 {
                    rightFootSensors = [sensor, Int.random(range: 30...50), Int.random(range: 30...50), Int.random(range: 25...30)]
                    leftFootSensors = [0, Int.random(range: 155...165), Int.random(range: 145...155), Int.random(range: 250...260)]
                } else if sensor < 160{
                    rightFootSensors = [sensor, Int.random(range: 50...80), Int.random(range: 50...80), Int.random(range: 30...40)]
                    leftFootSensors = [0, Int.random(range: 135...145), Int.random(range: 120...130), Int.random(range: 270...280)]
                } else if sensor < 200{
                    rightFootSensors = [sensor, Int.random(range: 80...100), Int.random(range: 80...100), Int.random(range: 40...50)]
                    leftFootSensors = [0, Int.random(range: 115...125), Int.random(range: 95...105), Int.random(range: 290...300)]
                } else if sensor < 240 {
                    rightFootSensors = [sensor, Int.random(range: 100...110), Int.random(range: 100...110), Int.random(range: 40...50)]
                    leftFootSensors = [0, Int.random(range: 95...105), Int.random(range: 70...80), 500 - sensor]
                } else if sensor < 280{
                    rightFootSensors = [sensor, Int.random(range: 110...120), Int.random(range: 110...120), Int.random(range: 40...50)]
                    leftFootSensors = [0, Int.random(range: 75...85), Int.random(range: 55...65), 500 - sensor]
                } else if sensor < 320 {
                    rightFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    leftFootSensors = [0, Int.random(range: 55...65), Int.random(range: 30...40), 500 - sensor]
                } else if sensor < 360 {
                    rightFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    leftFootSensors = [0, Int.random(range: 25...35), Int.random(range: 5...15), 500 - sensor]
                } else if sensor < 400 {
                    rightFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    leftFootSensors = [0, Int.random(range: 5...15), Int.random(range: 5...15), 500 - sensor]
                } else if sensor < 440 {
                    rightFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    leftFootSensors = [0, Int.random(range: 5...15), Int.random(range: 5...15), 500 - sensor]
                } else if sensor < 480 {
                    rightFootSensors = [sensor, Int.random(range: 150...160), Int.random(range: 150...160), Int.random(range: 40...50)]
                    leftFootSensors = [0, Int.random(range: 5...15), Int.random(range: 5...15), 500 - sensor]
                }
            }
            if fase == 3 {
                if sensor < 400{
                    rightFootSensors = [sensor, Int.random(range: 200...210), Int.random(range: 200...210), Int.random(range: 30...40)]
                    leftFootSensors = [0, 0, 0, 0]
                } else if sensor < 360 {
                    rightFootSensors = [sensor, Int.random(range: 230...230), Int.random(range: 230...230), Int.random(range: 70...80)]
                    leftFootSensors = [0, 0, 0, 0]
                } else if sensor < 320 {
                    rightFootSensors = [sensor, Int.random(range: 260...260), Int.random(range: 260...260), Int.random(range: 110...120)]
                    leftFootSensors = [0, 0, 0, 0]
                } else if sensor < 280 {
                    rightFootSensors = [sensor, Int.random(range: 280...280), Int.random(range: 280...280), Int.random(range: 150...160)]
                    leftFootSensors = [0, 0, 0, 0]
                } else if sensor < 240 {
                    rightFootSensors = [sensor, Int.random(range: 300...300), Int.random(range: 300...300), Int.random(range: 190...200)]
                    leftFootSensors = [0, 0, 0, 0]
                }
            }
        }
    }
}

