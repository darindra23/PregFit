//
//  ProgramsViewController.swift
//  PregFit
//
//  Created by Darindra R on 07/06/21.
//

import UIKit

class ProgramsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
}

fileprivate extension ProgramsViewController {
    func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProgramCell.nib(), forCellWithReuseIdentifier: ProgramCell.identifier)
    }
}

extension ProgramsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PregFitData.programs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCell.identifier, for: indexPath) as! ProgramCell
        cell.program = PregFitData.programs[indexPath.item]
        cell.didClick = { [weak self] in
            let programDetailVC = ProgramDetailViewController(nibName: ProgramDetailViewController.identifier, bundle: nil)
            programDetailVC.program = PregFitData.programs[indexPath.row]
            
            self?.navigationController?.pushViewController(programDetailVC, animated: true)
        }
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width - 32, height: 250)
    }
}
