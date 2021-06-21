//
//  OnBoardingUICollectionViewCell.swift
//  PregFit
//
//  Created by Rizqi Ahmad Kurniawan on 15/06/21.
//

import UIKit

class OnBoardingUICollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnBoardingUICollectionViewCell.self)
    
    @IBOutlet weak var AccesoryImageView: UIImageView!
    @IBOutlet weak var IconImagaView: UIImageView!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var AnswerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    func setup(_ slide: OnBoarding) {
//        AccesoryImageView.image = slide.accessoryImage
//        IconImagaView.image = slide.iconImage
//        QuestionLabel.text = slide.question
//        AnswerLabel.text = slide.answer
//    }
    func setup(_ slide: SlideOnBoarding){
        AccesoryImageView.image = slide.accessoryImage
        IconImagaView.image = slide.iconImage
        QuestionLabel.text = slide.question
        AnswerLabel.text = slide.answer
    }
}
