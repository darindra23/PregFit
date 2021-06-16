//
//  ViewController.swift
//  PregFit
//
//  Created by Darindra R on 07/06/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension TabBarViewController {
    func setup() {
        
        tabBar.tintColor = .primaryBackground
        tabBar.unselectedItemTintColor = UIColor(hexString: "#DFDFDF")
        setViewControllers([programsTabBar(), exercisesTabBar()], animated: false)
        
    }

    func programsTabBar() -> UINavigationController {
        let title = "Programs"
        let image = "heart.text.square.fill"
        let programsVC = ProgramsViewController(nibName: title, bundle: nil)
        let programsNavVC = UINavigationController(rootViewController: programsVC)

        programsNavVC.navigationBar.prefersLargeTitles = true
        programsNavVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: image), tag: 0)
        programsVC.navigationItem.title = title

        return programsNavVC
    }

    func exercisesTabBar() -> UINavigationController {
        let title = "Exercises"
        let image = "figure.walk"
        let exercisesVC = ExercisesViewController(nibName: title, bundle: nil)
        let exercisesNavVC = UINavigationController(rootViewController: exercisesVC)

        exercisesNavVC.navigationBar.prefersLargeTitles = true
        exercisesNavVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: image), tag: 1)
        exercisesVC.navigationItem.title = title

        return exercisesNavVC
    }
}
