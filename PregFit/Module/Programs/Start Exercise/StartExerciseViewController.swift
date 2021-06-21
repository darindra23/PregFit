//
//  StartExerciseViewController.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 15/06/21.
//

import UIKit

class StartExerciseViewController: UIViewController {

    @IBOutlet weak var pageIndex: UILabel!
    @IBOutlet weak var imageStartExercise: UIImageView!
    @IBOutlet weak var timerUiView: PFTimerView!
    let hKit = HealthKitModal()

    var program: Program?
    var index: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        guard let program = self.program else {
            print("Exercise not set")
            return
        }
        pageIndex.text = "\(index + 1)/\(program.exercises.count)"
        imageStartExercise.image = UIImage(named: "\(program.exercises[index].exerciseName)"); imageStartExercise.layer.borderWidth = 1
        self.imageStartExercise.layer.borderColor = UIColor.borderTintPrimaryColor
        hKit.startMockHeartData()
        timerUiView.preparationTimer()
        timerUiView.delegate = self
    }

    @IBAction func skipExercise(_ sender: Any) {
        
        if index + 1 == program?.exercises.count{
            let successExerciseVC = SuccessPageViewController(nibName: "SuccessPageViewController", bundle: nil)
            successExerciseVC.hr = hKit.currentHR
            navigationController?.pushViewController(successExerciseVC, animated: true)
        }else{
            let vc = TimerViewController(nibName: "TimerViewController", bundle: nil)
            vc.program = program
            vc.index = index

            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}

extension StartExerciseViewController: PFTimerViewProtocol {
    func didEndTimer() {
        if index + 1 == program?.exercises.count{
            let successExerciseVC = SuccessPageViewController(nibName: "SuccessPageViewController", bundle: nil)
            successExerciseVC.hr = hKit.currentHR
            navigationController?.pushViewController(successExerciseVC, animated: true)
        }else{
            let vc = TimerViewController(nibName: "TimerViewController", bundle: nil)
            vc.program = program
            vc.index = index

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
