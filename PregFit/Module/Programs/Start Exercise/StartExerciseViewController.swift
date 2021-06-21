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
        timerUiView.preparationTimer()
        hKit.startMockHeartData()
    }

    @IBAction func skipExercise(_ sender: Any) {
        let vc = TimerViewController(nibName: "TimerViewController", bundle: nil)
        vc.program = program
        vc.index = index

        navigationController?.pushViewController(vc, animated: true)
    }

}
