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
    
    @IBAction func finishButton(_ sender: Any) {
        let vc = ProgramsViewController(nibName: "Programs", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

fileprivate extension SuccessPageViewController {
    func setup() {
        
        buttonFinish.dropShadow()

    }
}
