//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 三谷淳史 on 2018/10/27.
//  Copyright © 2018年 atsushi.mitani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let images: [String] = ["image_1.jpg", "image_2.jpg", "image_3.jpg"]
    
    var imageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: images[imageIndex])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex = imageIndex + 1
        }
        imageView.image = UIImage(named: images[imageIndex])
    }
    
    @IBAction func back(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex = imageIndex - 1
        }
        imageView.image = UIImage(named: images[imageIndex])
    }
    
    @IBAction func play(_ sender: Any) {
    }
    
}

