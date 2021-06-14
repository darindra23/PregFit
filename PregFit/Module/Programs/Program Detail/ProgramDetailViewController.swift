//
//  ProgramDetailViewController.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 10/06/21.
//

import UIKit

class ProgramDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var imageProgramDetail: UIImageView!
    @IBOutlet weak var nameProgramDetailLbl: UILabel!
    @IBOutlet weak var durationProgramDetailLbl: UILabel!
    @IBOutlet weak var kcalProgramDetailLbl: UILabel!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var exerciseTableView: UITableView!
    
    static let identifier = "ProgramDetailViewController"

    var program: Program?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return program?.exercises.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCell.identifier, for: indexPath) as! ReusableCell
        cell.exercise = program?.exercises[indexPath.row]
        cell.index = indexPath.row + 1 
        return cell
    }
    
}

fileprivate extension ProgramDetailViewController {
    func setup() {
        
        exerciseTableView.dataSource = self
        exerciseTableView.delegate = self
        exerciseTableView.register(ReusableCell.nib(), forCellReuseIdentifier: ReusableCell.identifier)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        buttonStart.dropShadow()

        if let filled = program {
            imageProgramDetail.image = filled.imageDetail
            nameProgramDetailLbl.text = filled.name
            durationProgramDetailLbl.text = "\(filled.duration) Minutes | "
            kcalProgramDetailLbl.text = "\(filled.kcal) Kcal"
        }
    }
}


