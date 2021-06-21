//
//  OnBoardingViewController.swift
//  PregFit
//
//  Created by Rizqi Ahmad Kurniawan on 14/06/21.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var AcceptButton: UIButton!

    let onboardingCollectionViewCellId = "OnBoardingUICollectionViewCell"

    var slides: [SlideOnBoarding] = []
    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1 {
                AcceptButton.isHidden = false
            } else if currentPage == slides.count - 2 {
                AcceptButton.isHidden = true
            }

        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        CollectionView.delegate = self
        CollectionView.dataSource = self
        self.CollectionView.register(UINib(nibName: "OnBoardingUICollectionViewCell", bundle: nil), forCellWithReuseIdentifier: onboardingCollectionViewCellId)
        AcceptButton.isHidden = true

        slides = [
            SlideOnBoarding(question: "What medical complications should stop you from exercising?", answer: "Heart and lung diseases, Diabetes, Anemia, Placenta previa, Preeclampsia", iconImage: UIImage(systemName: "exclamationmark.circle.fill") ?? UIImage(), accessoryImage: #imageLiteral(resourceName: "Onboarding")),
            SlideOnBoarding(question: "When should you stop exercising?", answer: "Fleck or Bleeding, Pain on your belly, or Bodily fatigue", iconImage: UIImage(systemName: "hand.raised.slash.fill") ?? UIImage(), accessoryImage: #imageLiteral(resourceName: "Onboarding")),
            SlideOnBoarding(question: "What do you need to prepare before exercising?", answer: "Wear an Apple Watch, Use sport clothing, Prepare required equipments, and being pregnant", iconImage: UIImage(systemName: "headphones.circle.fill") ?? UIImage(), accessoryImage: #imageLiteral(resourceName: "Onboarding"))
        ]
    }


    @IBAction func AcceptButtonClicked(_ sender: UIButton) {
        let tabBarVC = TabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        UserDefaults.standard.set(true, forKey: "isLogin")
        self.present(tabBarVC, animated: false, completion: nil)
    }
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingUICollectionViewCell.identifier, for: indexPath) as! OnBoardingUICollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        return CGSize(width: width, height: height - 120)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / width)
        PageControl.currentPage = currentPage
        self.currentPage = currentPage
    }
}
