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
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    let images: [String] = ["image_1.jpg", "image_2.jpg", "image_3.jpg"]
    
    var imageIndex: Int = 0
    
    // 自動再生中かどうか
    var isAutoPlaying: Bool = false
    
    // 自動再生用タイマー
    var autoPlayTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage()
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toDetail)))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func next(_ sender: Any) {
        showNextImage()
    }
    
    @IBAction func back(_ sender: Any) {
        showPreviousImage()
    }
    
    @IBAction func play(_ sender: Any) {
        if (isAutoPlaying) {
            autoPlayTimer.invalidate()
            nextButton.isEnabled = true
            backButton.isEnabled = true
            playButton.setTitle("再生", for: .normal)
            isAutoPlaying = false
        } else {
            autoPlayTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showNextImage), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
            playButton.setTitle("停止", for: .normal)
            isAutoPlaying = true
        }
    }
    
    /// 次の画像を表示
    @objc private func showNextImage() {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex = imageIndex + 1
        }
        showImage()
    }
    
    /// 前の画像を表示
    private func showPreviousImage() {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex = imageIndex - 1
        }
        showImage()
    }
    
    /// 画像を表示
    private func showImage() {
        imageView.image = UIImage(named: images[imageIndex])
    }

    /// 詳細画面へ
    @objc private func toDetail() {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController: DetailViewController = segue.destination as! DetailViewController
        detailViewController.image = images[imageIndex]
    }
}

