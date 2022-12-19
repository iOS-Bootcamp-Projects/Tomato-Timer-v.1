//
//  ViewController.swift
//  Tomato Timer v.1
//
//  Created by Aamer Essa on 19/12/2022.
//

import Cocoa

class ViewController: NSViewController {

  
    
    
    @IBOutlet weak var startBtn: NSButton!
    @IBOutlet weak var timerLabel: NSTextField!
    var timer = Timer()
    var count = Int()
    var timerCounting = false
    var timeLeft = 1500
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }

    override var representedObject: Any? {
        didSet {
        
        }
    }

    @IBAction func tomato(_ sender: Any) {
        timer.invalidate()
        timeLeft = 1500
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        timerCounting = true
        startBtn.title = "Stop"
    }
    
    @IBAction func stop(_ sender: Any) {
        if !timerCounting {
            timerCounting = true
            timer.invalidate()
            startBtn.title = "Stop"
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            
        } else {
            timerCounting = false
            timer.invalidate()
            startBtn.title = "Start"
            
        }
    }
    
    
    @objc func timerCounter(){
        
        timeLeft -= 1
           var currentTime = timeLeft
           let minutes = Int(currentTime/60)
           currentTime -= minutes * 60
           let seconds = Int(currentTime)
           let strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
           let strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
           timerLabel.stringValue = "\(strMinutes):\(strSeconds)"
        
    }
}

