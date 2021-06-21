//
//  StepsTableViewCell.swift
//  PregFit
//
//  Created by Peter Lee on 18/06/21.
//

import UIKit

class StepsTableViewCell: UITableViewCell {

    @IBOutlet weak var indexLbl: UILabel!
    @IBOutlet weak var nameExerciseLbl: UILabel!
    @IBOutlet weak var indexViewContainer: UIView!
    static let identifier = "StepsTableViewCell"

    var index: Int? {
        didSet {
            if let filled = index {
                indexLbl.text = "\(filled)"
            }
        }
    }

    var exercise: Exercise? {
        didSet {
            if let filled = exercise {
                nameExerciseLbl.text = filled.exerciseName
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    static func nib() -> UINib {
        return UINib(nibName: "StepsTableViewCell", bundle: nil)
    }
}

private extension StepsTableViewCell {
    func setup() {
        indexViewContainer.layer.cornerRadius = self.indexViewContainer.frame.size.width / 2
        indexViewContainer.clipsToBounds = true
    }
}
