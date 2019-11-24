//
//  ViewController.swift
//  TapBattle
//
//  Created by 原田澪 on 2019/11/22.
//  Copyright © 2019 MioHarada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countLabel1: UILabel!
    @IBOutlet var countLabel2: UILabel!
    @IBOutlet var tapButton1: UIButton!
    @IBOutlet var tapButton2: UIButton!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var wunnerLabel: UILabel!
    @IBOutlet var tap1Image: UIImageView!
    @IBOutlet var tap2Image: UIImageView!
    
    var countTime: Float = 10.0
    var timer: Timer = Timer()
    var count1: Int = 0
    var count2: Int = 0
    var winner: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tap1Image.isHidden = true
        tap2Image.isHidden = true
        tapButton1.isHidden = true
        tapButton2.isHidden = true
    }
    
    @IBAction func start() {
        countTime = 10.0
        count1 = 0
        count2 = 0
        countLabel1.text = String(count1)
        countLabel2.text = String(count2)
        wunnerLabel.text = ""
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.down), userInfo: nil, repeats: true)
            tapButton1.isHidden = false
            tapButton2.isHidden = false
            startButton.isHidden = true
        }
    }
    
    @IBAction func tap1() {
        count1 += 1
        countLabel1.text = String(count1)
        tap1Image.isHidden = true
    }
    
    @IBAction func tap1Begin() {
        tap1Image.isHidden = false
    }
    
    @IBAction func tap2() {
        count2 += 1
        countLabel2.text = String(count2)
        tap2Image.isHidden = true
    }
    
    @IBAction func tap2Begin() {
        tap2Image.isHidden = false
    }
    
    @objc func down() {
        countTime -= 0.01
        if countTime <= 0 {
            timer.invalidate()
            timeLabel.text = String(0)
            tapButton1.isHidden = true
            tapButton2.isHidden = true
            startButton.isHidden = false
            
            if count1 > count2 {
                winner = "左の人"
            } else if count1 < count2 {
                winner = "右の人"
            } else {
                winner = "どっちも"
            }
            wunnerLabel.text = "勝者は" + winner + "！"
        } else {
            timeLabel.text = String(format : "%.2f", countTime)
        }
    }
}

