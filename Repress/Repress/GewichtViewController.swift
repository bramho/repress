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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gifManager = SwiftyGifManager.defaultManager
        let gif = UIImage(gifName: "Logo-GIF.gif")
        let imageView = UIImageView(gifImage: gif, manager: gifManager, loopCount: 10)
        imageView.frame = CGRect(x: 0.0, y: 5.0, width: view.bounds.size.width, height: view.bounds.size.height)
        view.addSubview(imageView)
    }
    
    @IBAction func button1(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
