//
//  DetailCell.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 09/06/21.
//

import UIKit

class ProgramCell: UICollectionViewCell {


    @IBOutlet weak var viewProgramCell: UIView!
    @IBOutlet weak var imageProgram: UIImageView!
    @IBOutlet weak var nameProgramLbl: UILabel!
    @IBOutlet weak var durationProgramLbl: UILabel!
    @IBOutlet weak var kcalProgramLbl: UILabel!
    
    static let identifier = "programCell"
    
    var didClick: (() -> ())?
    
    var program: Program?{
        didSet{
            if let filled = program{
                imageProgram.image = filled.image
                nameProgramLbl.text = filled.name
                durationProgramLbl.text = "\(filled.duration) Minutes | "
                kcalProgramLbl.text = "\(filled.kcal) Kcal"
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.programPressed(_:)))
                viewProgramCell.addGestureRecognizer(tap)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @objc func programPressed(_: UITapGestureRecognizer) {
        didClick?()
    }

    static func nib() -> UINib {
        return UINib(nibName: "ProgramCell", bundle: nil)
    }
        
}
