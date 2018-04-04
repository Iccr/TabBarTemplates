//
//  ModuleAViewController.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation
import UIKit

class MainWireframe {
    static let shared: MainWireframe = MainWireframe()
    weak  var view: UIViewController!
    private lazy var loadingWireFrame: LoadingWireframeInput = {LoadingWireframe()}()
    private lazy var moduleAWireFrame: ModuleAWireframeInput = {ModuleAWireframe()}()
    private lazy var moduleBWireFrame: ModuleBWireframeInput = {ModuleBWireframe()}()
    private lazy var moduleCWireFrame: ModuleCWireframeInput = {ModuleCWireframe()}()
    private lazy var moduleDWireFrame: ModuleDWireframeInput = {ModuleDWireframe()}()
    private lazy var moduleEWireFrame: ModuleEWireframeInput = {ModuleEWireframe()}()
}

extension MainWireframe: MainWireframeInput {

    func show(index: Int) {
        
    }
    
    var storyboardName: String {return "Main"}
    
    func getMainView() -> UIViewController {
        let viewController =  MainViewController()
        // viewcontrollers for tabBar
        let viewcontroller1 = moduleAWireFrame.getMainView()
        let viewcontroller2 = moduleBWireFrame.getMainView()
        let viewcontroller3 = moduleCWireFrame.getMainView()
        let viewcontroller4 = moduleDWireFrame.getMainView()
        let viewcontroller5 = moduleEWireFrame.getMainView()

        // wrap it in navigation bar
        let navViewController1 = UINavigationController(rootViewController: viewcontroller1)
        let navViewController2 = UINavigationController(rootViewController: viewcontroller2)
        let navViewController3 = UINavigationController(rootViewController: viewcontroller3)
        let navViewController4 = UINavigationController(rootViewController: viewcontroller4)
        let navViewController5 = UINavigationController(rootViewController: viewcontroller5)
        
        // viewcontroller to be displayed by tab bar
        let viewControllers = [navViewController1, navViewController2, navViewController3, navViewController4, navViewController5]
        viewController.setup(viewControllers: viewControllers)
        viewController.setupTabItem()
        
        self.view = viewController
        return viewController
    }
    
   
    
    func replaceLoginToProfile() {
        //        let profileView = self.profileWireframe.getMainView()
        //
        //        let nav = UINavigationController(rootViewController: profileView)
        //        if let view = self.view as? MainViewController {
        //            view.viewControllers?.remove(at: 3)
        //            view.viewControllers?.insert(nav, at: 3)
        //        }
        //
        //        self.show(index: 3)
    }
    

    static func logout() {
//        guard let window = MainWireframe.shared?.window else {return}
//        MainWireframe.shared = nil
//        LoginWireframe().openMainViewAsNavigationControllerIn(window: window)
    }
}
