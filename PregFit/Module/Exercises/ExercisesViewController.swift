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

    var exercise: [Exercise] = PregFitData.exercises

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

fileprivate extension ExercisesViewController {
    func setup() {
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(ExercisesCell.nib, forCellReuseIdentifier: ExercisesCell.identifier)
    }
}

extension ExercisesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exercise.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExercisesCell.identifier, for: indexPath) as! ExercisesCell
        cell.viewModel = ExercisesViewModel(with: exercise[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ExerciseDetailViewController(nibName: "ExerciseDetailViewController", bundle: nil)
        
        vc.exercise = PregFitData.exercises[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: false)
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

extension ExercisesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText = searchText.trimmingCharacters(in: .whitespaces)

        let smartSearchMatcher = SmartSearchMatcher(searchString: searchText)

        exercise = PregFitData.exercises.filter({ exercise in
            return smartSearchMatcher.matches(exercise.exerciseName)
        })

        self.tableView.reloadData()
    }
}
