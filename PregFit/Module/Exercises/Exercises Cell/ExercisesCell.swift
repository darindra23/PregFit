//
//  ExercisesCell.swift
//  PregFit
//
//  Created by Darindra R on 10/06/21.
//

import UIKit

class ExercisesCell: UITableViewCell {
    @IBOutlet weak var exercisesImage: UIImageView!
    @IBOutlet weak var exercisesName: UILabel!

    static var identifier: String {
        return "exercisesCell"
    }

    static var nib: UINib {
        get {
            return UINib(nibName: "ExercisesCell", bundle: nil)
        }
    }

    var viewModel: ExercisesViewModel? {
        didSet {
            if let viewModel = viewModel {
                exercisesImage.image = UIImage(named: viewModel.image)
                exercisesName.text = viewModel.name
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
}
