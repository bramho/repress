//
//  LaunchScreenViewController.swift
//  Repress
//
//  Created by Bram Honingh on 19-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gifManager = SwiftyGifManager.defaultManager
        let gif = UIImage(gifName: "Loading-animatie-formaat.gif")
        self.imageView.setGifImage(gif, manager: gifManager, loopCount: 1)
        self.imageView.delegate = (self as SwiftyGifDelegate)
        
        let imageWidth: CGFloat = 960
        let imageHeight: CGFloat = 540
        
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LaunchScreenViewController: SwiftyGifDelegate {
    func gifDidLoop(sender: UIImageView) {
        self.performSegue(withIdentifier: "loadingScreenSegue", sender: nil)
    }
}
