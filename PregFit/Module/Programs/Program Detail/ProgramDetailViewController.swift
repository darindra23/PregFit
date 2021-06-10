//
//  ProgramDetailViewController.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 10/06/21.
//

import UIKit

class ProgramDetailViewController: UIViewController {
    
    @IBOutlet weak var imageProgramDetail: UIImageView!
    @IBOutlet weak var nameProgramDetailLbl: UILabel!
    @IBOutlet weak var durationProgramDetailLbl: UILabel!
    @IBOutlet weak var kcalProgramDetailLbl: UILabel!
    @IBOutlet weak var buttonStart: UIButton!
    
    static let identifier = "ProgramDetailViewController"
    
    var program: Program?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

fileprivate extension ProgramDetailViewController {
    func setup() {
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        buttonStart.dropShadow()
        
        if let filled = program{
            imageProgramDetail.image = filled.imageDetail
            nameProgramDetailLbl.text = filled.name
            durationProgramDetailLbl.text = "\(filled.duration) Minutes | "
            kcalProgramDetailLbl.text = "\(filled.kcal) Kcal"
        }
    }
}


