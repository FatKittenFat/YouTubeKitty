//
//  RootPageViewController.swift
//  YouTubeKitty
//
//  Created by Fatima Ramirez on 30/06/24.
//

import UIKit

protocol RootPageProtocol: AnyObject {
    func currentPage(_ index: Int)
}

class RootPageViewController: UIPageViewController {
    
    var subViewControllers = [UIViewController]()
    var curretIndex = 0
    weak var delegateRootPage: RootPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        setupViewController()
        
    
    }
    
    private func setupViewController (){
        
        subViewControllers = [HomeViewController(), VideosViewController(), PlaylistViewController(), ChannelsViewController(), AboutViewController()]
        
        _ = subViewControllers.enumerated().map({$0.element.view.tag = $0.offset})
        setViewControllerFromIndex(index: 0, direction: .forward)
        
    }
    
    func setViewControllerFromIndex(index: Int, direction: NavigationDirection, animated: Bool = true) {
        
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
            
    }
    
}

extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    // controller proximo
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index <= 0 {
            return nil
        }
        return subViewControllers[index-1]
        
    }
    
    // controller anterior
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index >= (subViewControllers.count-1){
            return nil
        }
        return subViewControllers[index+1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("Pasando pagina:", finished)
        
        if let index = pageViewController.viewControllers?.first?.view.tag {
            print("pagina de controlador: ", index)
            curretIndex = index
            delegateRootPage?.currentPage(index)
        }
        
    }
    
    
}
