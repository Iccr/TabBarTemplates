//
//  AppDelegate.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//  Copyright © 2018 ccr. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import FBSDKCoreKit
import GoogleSignIn
import AlamofireNetworkActivityIndicator

var isDebug = true

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        NetworkActivityIndicatorManager.shared.isEnabled = true
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
        loggerEnabled = isDebug
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        self.configureNavBar()
        self.configureTabBar()
        self.entryPoint()
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation) || GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    private func entryPoint() {
        let initialWireframe = LoadingWireframe()
        window.map(initialWireframe.openMainViewIn(window:))
//        window.map(initialWireframe.openMainViewIn(window: window))
//        let initialWireframe = LoadingWireframe()
//        window.map(initialWireframe.openMainViewIn(window:))
//        let initialWireframe = EulaAgreementWireframe()
//        window.map(initialWireframe.openMainViewIn(window:))
    }
    
    
    private func configureNavBar() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.isTranslucent = false
        navBarAppearance.barTintColor = Colors.NavBar.barTint
        navBarAppearance.setBackgroundImage(UIImage(), for: .default)
        navBarAppearance.shadowImage = Colors.NavBar.shadow.image()
        
        let font = Fonts.NavBar.titleFont
        
        navBarAppearance.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: Colors.NavBar.tint,
            NSAttributedStringKey.font: font]
        
//        navBarAppearance.backIndicatorImage = #imageLiteral(resourceName: "back")
//        navBarAppearance.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back")
        navBarAppearance.tintColor = Colors.NavBar.tint
    }
    
    private func configureTabBar() {
        let tabBarAppearance = UITabBarItem.appearance()
        let font = Fonts.TabBar.itemFont
        
        tabBarAppearance.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor : Colors.TabBar.textItemSelected,
             NSAttributedStringKey.font: font],
            for: UIControlState.selected)
        
        tabBarAppearance.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor : Colors.TabBar.textItemNotSelected,
             NSAttributedStringKey.font: font],
            for: UIControlState.normal)
    }
}

