//
//  ThirdViewController.swift
//  Repress
//
//  Created by Geart on 11/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation
import UIKit

class GewichtViewController: UIViewController, BWWalkthroughViewControllerDelegate {
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
        let rightShoeWeight = weightFaker.getRightShoeWeight(totalWeight: weight, leftShoeWeight: leftShoeWeight)
        self.leftShoeWeightLabel.text = String(leftShoeWeight) + "KG"
        self.rightShoeWeightLabel.text = String(rightShoeWeight) + "KG"
        
        self.leftShoePercentageLabel.text = String(Int((leftShoeWeight / weight) * 100)) + "%"
        self.rightShoePercentageLabel.text = String(Int((rightShoeWeight / weight) * 100)) + "%"
    }
    
    @IBAction func showWalkthroughButtonPressed(_ sender: Any) {
        let stb = UIStoryboard(name: "Main", bundle: nil)
        let walkthrough = stb.instantiateViewController(withIdentifier: "Main") as! BWWalkthroughViewController
        let page_zero = stb.instantiateViewController(withIdentifier: "gewichtwalk0")
        
        walkthrough.delegate = self
        walkthrough.add(viewController:page_zero)
        //walkthrough.add(viewController:page_one)
        //walkthrough.add(viewController:page_two)
        //walkthrough.add(viewController:page_three)
        
        self.present(walkthrough, animated: true, completion: nil)
    }
    func walkthroughCloseButtonPressed() {
        self.dismiss(animated: true, completion: nil)
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
