//
//  WireframeInput.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

protocol WireframeInput {
    var window: UIWindow? {get}
    weak var view: UIViewController! {get}
    var storyboardName: String {get}
    func openMainView(source: UIViewController)
    func pushMainView(on source: UIViewController)
    func pushMainView(in source: UINavigationController)
    func getMainView() -> UIViewController
    func openMainViewIn(window: UIWindow)
    func openViewControllerWithNavigation(viewController: UIViewController, source: UIViewController)
}

extension WireframeInput {
    var window: UIWindow? {
        return (UIApplication.shared.delegate as! AppDelegate).window
    }
    
    func viewControllerFromStoryboard<T: UIViewController>(of type: T.Type) -> T {
        let sb =  UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        return sb
    }
    
    func openMainViewIn(window: UIWindow) {
        let view = self.getMainView()
        window.rootViewController = view
    }
    
    func openMainViewAsNavigationControllerIn(window: UIWindow) {
        let view = self.getMainView()
        let nav = UINavigationController.init(rootViewController: view)
        window.rootViewController = nav
    }
    
    func openMainView(source: UIViewController) {
        let mainView = self.getMainView()
        source.present(mainView, animated: true, completion: nil)
    }
    
    func pushMainView(on source: UIViewController) {
        let mainView = self.getMainView()
        source.navigationController?.pushViewController(mainView, animated: true)
    }
    
    func pushMainView(in source: UINavigationController) {
        let mainView = self.getMainView()
        source.pushViewController(mainView, animated: true)
    }
    
    func openViewControllerWithNavigation(viewController: UIViewController, source: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        source.present(nav, animated: true, completion: nil)
    }
    
}
