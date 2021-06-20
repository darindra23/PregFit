//
//  Timer.swift
//  PregFit
//
//  Created by Olivia Dwi  Susanti on 10/06/21.
//

import UIKit

class PFTimerView: UIView {
    
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    lazy var displayLink = CADisplayLink(target: self, selector: #selector(runCountdown))
    lazy var prepareDL = CADisplayLink(target: self, selector: #selector(runPreparation))
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
//    var timerCountdown = Timer()
    var durationInSecond = 31
    var durationPreparation = 4
    
    @IBOutlet weak var preparationLabel: UILabel!
    @IBOutlet weak var preparationTimerLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet var content: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        Bundle(for: PFTimerView.self).loadNibNamed("PFTimerView", owner: self, options: nil)
//        Bundle.main.loadNibNamed("PFTimerView", owner: self, options: nil)
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        TimerLabel.isHidden = true
        addSubview(content)
    }
    
    //progress bar
    func backgroundProgressBar() {
        // for background progress bar
        let center = content.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.white.cgColor
        trackLayer.strokeColor = #colorLiteral(red: 0.5856153369, green: 0.5607277155, blue: 0.4674222469, alpha: 1)
        trackLayer.lineWidth = 10
        trackLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        trackLayer.strokeEnd = 3
        content.layer.insertSublayer(trackLayer, at: 1)
    }
    
    func progressBarRun() {
        // progress bar run
        let centerRun = content.center
        let circularPathRun = UIBezierPath(arcCenter: centerRun, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPathRun.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = #colorLiteral(red: 0.01508613583, green: 0.142742306, blue: 0.1384011805, alpha: 0)
        shapeLayer.strokeEnd = 0
        content.layer.insertSublayer(shapeLayer, at: 2)
    }
    
    @objc func startAnimationProgressBar() {
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
    @objc func runCountdown() {
        durationInSecond -= 1
        TimerLabel.text = "\(durationInSecond)"
        
        
        if durationInSecond <= 0 {
            displayLink.invalidate()
            displayLink.remove(from: .current, forMode: .common)
        }
    }
    
    // preparation
    @objc func runPreparation() {
        TimerLabel.text = ""
        durationPreparation -= 1
        preparationLabel.text = "\(durationPreparation)"
        
        if durationPreparation <= 0 {
            preparationTimerLabel.isHidden = true
            preparationLabel.isHidden = true
            prepareDL.remove(from: .current, forMode: .common)
            countdownTimer()
        }
    }
    
    func preparationTimer() {
        preparationTimerLabel.isHidden = false
        prepareDL.preferredFramesPerSecond = 1
        prepareDL.add(to: .current, forMode: .common)
        
        preparationLabel.text = "\(durationPreparation)"
    }
    
    func countdownTimer() {
        preparationLabel.isHidden = true
        preparationTimerLabel.isHidden = true
        TimerLabel.isHidden = false
        displayLink.preferredFramesPerSecond = 1
        displayLink.add(to: .current, forMode: .common)
        backgroundProgressBar()
        progressBarRun()
        startAnimationProgressBar()
    }
}
