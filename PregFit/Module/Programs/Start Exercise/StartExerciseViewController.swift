//
//  StartExerciseViewController.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 15/06/21.
//

import UIKit

class StartExerciseViewController: UIViewController {

    @IBOutlet weak var imageStartExercise: UIImageView!
    @IBOutlet weak var timerUiView: PFTimerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        imageStartExercise.layer.borderWidth = 1
        self.imageStartExercise.layer.borderColor = UIColor.borderTintPrimaryColor
        timerUiView.preparationTimer()
    }
    

}
