//
//  ReusableCell.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 11/06/21.
//

import UIKit

class ReusableCell: UITableViewCell {
    
    @IBOutlet weak var indexLbl: UILabel!
    @IBOutlet weak var nameExerciseLbl: UILabel!
    
    static let identifier = "ReusableCell"
    var index: Int? {
        didSet {
            if let filled = index {
                indexLbl.text = "\(filled)"
            }
        }
    }
    
    var exercise: Exercise?{
        didSet{
            if let filled = exercise{
                nameExerciseLbl.text = filled.exerciseName
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ReusableCell", bundle: nil)
    }
    
}
