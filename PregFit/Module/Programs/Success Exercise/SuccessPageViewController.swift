//
//  SuccessPageViewController.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 18/06/21.
//

import UIKit

class SuccessPageViewController: UIViewController {
    

    @IBOutlet weak var buttonFinish: UIButton!
    @IBOutlet weak var lastBPMLbl: UILabel!
    
    var hr: Int?
//    var currentHR: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func finishButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)    }
    
}

fileprivate extension SuccessPageViewController {
    func setup() {
        lastBPMLbl.text = "Current BPM \(hr ?? Int())"
        print("BPM \(hr ?? Int())")
        
//        if let hr = hKit.currentHR {
//            print("BPM \(hr ?? Int())")
//        }
//        hKit.startMockHeartData()
//        hKit.stopMockHeartData()
        buttonFinish.dropShadow()


    }
}
