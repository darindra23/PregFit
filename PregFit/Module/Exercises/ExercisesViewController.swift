//
//  ExercisesViewController.swift
//  PregFit
//
//  Created by Darindra R on 07/06/21.
//

import UIKit

class ExercisesViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

fileprivate extension ExercisesViewController {
    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExercisesCell.nib, forCellReuseIdentifier: ExercisesCell.identifier)
    }
}

extension ExercisesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PregFitData.exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExercisesCell.identifier, for: indexPath) as! ExercisesCell
        cell.viewModel = ExercisesViewModel(with: PregFitData.exercises[indexPath.row])

        return cell
    }
}

