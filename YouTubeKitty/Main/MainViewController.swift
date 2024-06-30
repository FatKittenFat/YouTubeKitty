//
//  MainViewController.swift
//  YouTubeKitty
//
//  Created by Fatima Ramirez on 30/06/24.
//

import UIKit

class MainViewController: UIViewController {

    var rootPageViewController: RootPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        print("main view controller")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            destination.delegateRootPage = self
            rootPageViewController = destination
        }
    }
}

extension MainViewController: RootPageProtocol {
    func currentPage(_ index: Int) {
        print("currentPage", index)
    }
}
