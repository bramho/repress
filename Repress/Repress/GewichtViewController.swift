//
//  ThirdViewController.swift
//  Repress
//
//  Created by Geart on 11/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation
import UIKit

class GewichtViewController: UIViewController {
    let weightFaker = WeightFaker.init()
    
    @IBOutlet weak var weightLabel: LargeBlueLabel!
    
    @IBOutlet weak var leftShoePercentageLabel: SmallBlueLabel!
    @IBOutlet weak var leftShoeWeightLabel: SmallBlueLabel!
    
    @IBOutlet weak var rightShoeWeightLabel: SmallBlueLabel!
    @IBOutlet weak var rightShoePercentageLabel: SmallBlueLabel!
    
    @IBAction func demoButton(_ sender: Any) {
        let weight: Double = weightFaker.getRandomWeight()
        self.weightLabel.text = String(weight)
        displayWeightDistrubution(weight: weight)
    }
    
    func displayWeightDistrubution(weight: Double) {
        let leftShoeWeight = weightFaker.devideWeight(weight: weight)
        
        self.leftShoeWeightLabel.text = String(leftShoeWeight) + "KG"
        self.rightShoeWeightLabel.text = String(weightFaker.getRightShoeWeight(totalWeight: weight, leftShoeWeight: leftShoeWeight)) + "KG"
    }
    
    @IBAction func button1(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
