//
//  ReusableCell.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 11/06/21.
//

import UIKit

class ReusableCell: UITableViewCell {
    @IBOutlet weak var indexViewContainer: UIView!
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
        return UINib(nibName: "ReusableCell", bundle: nil)
    }
}

private extension ReusableCell {
    func setup() {
        indexViewContainer.layer.cornerRadius = self.indexViewContainer.frame.size.width / 2
        indexViewContainer.clipsToBounds = true
    }
}
