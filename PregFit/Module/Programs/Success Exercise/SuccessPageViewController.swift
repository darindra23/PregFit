//
//  SuccessPageViewController.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 18/06/21.
//

import UIKit

class SuccessPageViewController: UIViewController {

    @IBOutlet weak var buttonFinish: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

fileprivate extension SuccessPageViewController {
    func setup() {
        
        buttonFinish.dropShadow()

    }
}
