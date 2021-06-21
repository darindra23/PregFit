//
//  ExerciseDetailViewController.swift
//  PregFit
//
//  Created by Peter Lee on 14/06/21.
//

import UIKit

class ExerciseDetailViewController: UIViewController {
    @IBOutlet weak var detailTable: UITableView!

    static let identifier = "ExerciseDetailViewController"

    var exercise: Exercise?
    var program: Program?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = exercise?.exerciseName
        setup()
    }
}

fileprivate extension ExerciseDetailViewController {
    func setup() {
        detailTable.dataSource = self
        detailTable.delegate = self
        detailTable.tableFooterView = UIView()

        detailTable.register(DetailTableViewCell.nib(), forCellReuseIdentifier: DetailTableViewCell.identifier)

        detailTable.register(VideoTableViewCell.nib(), forCellReuseIdentifier: VideoTableViewCell.identifier)

    }
}

extension ExerciseDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier, for: indexPath) as! VideoTableViewCell

            cell.configure(with: exercise?.videoURL ?? "")

            return cell
        }

        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
            cell.configure(with: "Requirements", detail: exercise?.requirements)
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        cell.configure(with: "Steps", detail: exercise?.steps)
        return cell



//        let cell =       tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
//        cell.configure(with: exercise!.steps, detail: exercise?.requirements)
//        return cell

//        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier , for: indexPath)
//
//        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.row == 0 {
            return 250
        } else if indexPath.row == 1 {
            return CGFloat((exercise?.requirements?.count)! * 85)
        } else {
            return CGFloat((exercise?.steps.count)! * 140)
        }

    }
}


