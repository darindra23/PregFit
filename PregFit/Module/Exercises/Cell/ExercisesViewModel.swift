//
//  ExercisesViewModel.swift
//  PregFit
//
//  Created by Darindra R on 10/06/21.
//

import Foundation

class ExercisesViewModel {
    var image: String
    var name: String

    init(with model: Exercise ) {
        self.image = model.exerciseName
        self.name = model.exerciseName
    }
}
