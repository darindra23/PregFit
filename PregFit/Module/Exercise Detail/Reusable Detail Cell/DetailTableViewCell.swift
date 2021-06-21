//
//  DetailTableViewCell.swift
//  PregFit
//
//  Created by Peter Lee on 15/06/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    static let identifier = "DetailTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "DetailTableViewCell", bundle: nil)
    }

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailTable: UITableView!
    
    var exercise: Exercise?
//    var exercise: [Exercise] = PregFitData.exercises
    
    var detailArr: [String] = []
    var stepsArr: [String] = []


    public func configure(with label: String, detail: [String]?){
        detailArr = detail!
        detailLabel.text = label
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

fileprivate extension DetailTableViewCell {
    func setup() {
        detailTable.dataSource = self
        detailTable.delegate = self
        detailTable.tableFooterView = UIView()

        detailTable.register(StepsTableViewCell.nib(), forCellReuseIdentifier: StepsTableViewCell.identifier)

    }
}

extension DetailTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        detailArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if detailLabel.text == "Requirements"{
            let cell = tableView.dequeueReusableCell(withIdentifier: StepsTableViewCell.identifier, for: indexPath) as! StepsTableViewCell
            cell.nameExerciseLbl.text = detailArr[indexPath.row]
            cell.index = indexPath.row + 1
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepsTableViewCell.identifier, for: indexPath) as! StepsTableViewCell
            cell.nameExerciseLbl.text = detailArr[indexPath.row]
            cell.index = indexPath.row + 1
            return cell
        }

//        if tableView == detailTable{
//            let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCell.identifier, for: indexPath) as! ReusableCell
//            cell.nameExerciseLbl.text = detailArr[indexPath.row]
//            cell.index = indexPath.row + 1
//            return cell
//        }
//
//        if tableView == stepsTable{
//            let cell = tableView.dequeueReusableCell(withIdentifier: StepsTableViewCell.identifier, for: indexPath) as! StepsTableViewCell
//            cell.nameExerciseLbl.text = stepsArr[indexPath.row]
//            print(stepsArr[indexPath.row])
//            cell.index = indexPath.row + 1
//
//            return cell
//        }
//
//        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if detailLabel.text == "Requirements"{
            return 65
        } else {
            return 125
        }
    }

}
