//
//  TimerViewController.swift
//  PregFit
//
//  Created by Olivia Dwi  Susanti on 08/06/21.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    lazy var displayLink = CADisplayLink(target: self, selector: #selector(runCountdown))
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    var timerCountdown = Timer()
    var durationInSecond = 30 // Get from settings in User default
    var resumeTapped = false

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Timer VC"
        
        //progress bar
        backgroundProgressBar()
        progressBarRun()
        countdownTimer()
        startAnimationProgressBar()
    }
    
    @IBAction func skipAction(_ sender: UIButton) {
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        if self.resumeTapped == false {
            sender.setImage(UIImage.init(systemName: "play.circle.fill"), for: .normal)
            timerCountdown.invalidate()
            self.resumeTapped = true
            pauseAnimationProgressBar()
            displayLink.isPaused = true
        } else {
            self.resumeTapped = false
            sender.setImage(UIImage.init(systemName: "pause.circle.fill"), for: .normal)
            countdownTimer()
            resumeAnimationProgressBar()
            displayLink.isPaused = false
        }
    }
    
    //progress bar
    func backgroundProgressBar() {
        // for background progress bar
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.white.cgColor
        trackLayer.strokeColor = #colorLiteral(red: 0.5856153369, green: 0.5607277155, blue: 0.4674222469, alpha: 1)
        trackLayer.lineWidth = 10
        trackLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        trackLayer.strokeEnd = 3
        view.layer.insertSublayer(trackLayer, at: 1)
    }
    
    func progressBarRun() {
        // progress bar run
        let centerRun = view.center
        let circularPathRun = UIBezierPath(arcCenter: centerRun, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPathRun.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = #colorLiteral(red: 0.01508613583, green: 0.142742306, blue: 0.1384011805, alpha: 0)
        shapeLayer.strokeEnd = 0
        view.layer.insertSublayer(shapeLayer, at: 2)
    }
    
    @objc private func startAnimationProgressBar() {
        basicAnimation.toValue = 1
        setUpDurationAnimation()// you need to give CFTimeInteval
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.isAdditive = true
        shapeLayer.add(basicAnimation, forKey: "animationProgressBarStarted")
    }
    
    func setUpDurationAnimation()  {
        basicAnimation.duration =  CFTimeInterval(durationInSecond + Int((1)) * (durationInSecond / 5))
    }
    
    func pauseAnimationProgressBar() {
        let timeSincePaused = shapeLayer.convertTime(CACurrentMediaTime(), from: nil)
        shapeLayer.speed = 0
//        stopAnimationProgressBar()
        shapeLayer.timeOffset = timeSincePaused
        print (timeSincePaused)
    }
    
    func resumeAnimationProgressBar() {
        let pausedTime = shapeLayer.timeOffset
        shapeLayer.speed = 1
        shapeLayer.timeOffset = 0
        shapeLayer.beginTime = 0
        let timeSincePaused = shapeLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        print(timeSincePaused)
        shapeLayer.beginTime = timeSincePaused
    }
    
    // countdown
    @objc private func runCountdown() {
        durationInSecond -= 1
        TimerLabel.text = "\(durationInSecond)"
        
        if durationInSecond <= 0 {
            timerCountdown.invalidate()
//            TimerLabel.text = "Times Up!"
            displayLink.remove(from: .current, forMode: .common)
        }
    }
    
    func countdownTimer() {
        displayLink.preferredFramesPerSecond = 1
        displayLink.add(to: .current, forMode: .common)
        
        TimerLabel.text = "\(durationInSecond)"
//        timerCountdown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runCountdown), userInfo: nil, repeats: true)
    }
    
}
