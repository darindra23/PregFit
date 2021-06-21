//
//  TimerViewController.swift
//  PregFit
//
//  Created by Olivia Dwi  Susanti on 08/06/21.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerView: PFTimerView!

    @IBOutlet weak var skipButton: UIButton!

    @IBOutlet weak var pauseButton: UIButton!

    var resumeTapped = false
    var program: Program?
    var index: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = ""
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#D4A95F")

        // kalo buat buat break
        timerView.countdownTimer()
        timerView.delegate = self
    }

    @IBAction func skipAction(_ sender: UIButton) {
        if program?.exercises.count == index {
//            navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        } else {
            let vc = StartExerciseViewController(nibName: "StartExerciseViewController", bundle: nil)
            vc.program = program
            vc.index = index! + 1

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func pauseAction(_ sender: UIButton) {
        if self.resumeTapped == false {
            sender.setImage(UIImage.init(systemName: "play.circle.fill"), for: .normal)
            self.resumeTapped = true
            timerView.pauseAnimationProgressBar()
            timerView.displayLink.isPaused = true
        } else {
            self.resumeTapped = false
            sender.setImage(UIImage.init(systemName: "pause.circle.fill"), for: .normal)
            timerView.resumeAnimationProgressBar()
            timerView.displayLink.isPaused = false
        }
    }



}

extension TimerViewController: PFTimerViewProtocol{
    func didEndTimer() {
        if program?.exercises.count == index {
//            navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        } else {
            let vc = StartExerciseViewController(nibName: "StartExerciseViewController", bundle: nil)
            vc.program = program
            vc.index = index! + 1

            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
