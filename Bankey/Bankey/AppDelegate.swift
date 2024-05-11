//
//  AppDelegate.swift
//  Bankey
//
//  Created by Ana Carolina Barbosa de Souza on 06/05/24.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingViewController(heroImageName: " ", titleText: " ")
//    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
//        onboardingViewController.delegate = self
        
        registerForNotifications()
        
//        dummyViewController.logoutDelegate = self
        
//        let vc = mainViewController
//        vc.setStatusBar()
//        
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().backgroundColor = appColor
//        
//        window?.rootViewController = vc
//        
//        return true
//        
//        let vc1 = SearchViewController()
//        let vc2 = ContactsViewController()
//        let vc3 = FavoritesViewController()
//        
//        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
//        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
//        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
//        
//        let nc1 = UINavigationController(rootViewController: vc1)
//        let nc2 = UINavigationController(rootViewController: vc2)
//        let nc3 = UINavigationController(rootViewController: vc3)
//        
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = [nc1, nc2, nc3]

       
//        window?.rootViewController = mainViewController
//        window?.rootViewController = UITabBarController()
//        tabBarController.viewControllers = [nc1, nc2, nc3]

        
//        window?.rootViewController = onboardingContainerViewController
//        window?.rootViewController = loginViewController
//        window?.rootViewController = loginViewController()
//        window?.rootViewController = AccountSummaryViewController()
//        window?.rootViewController = OnboardingContainerViewController()
//        window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is faster, easier to use and has a brand new look and feel that will make you feel like you are back in the 80s.")
        
//        mainViewController.selectedIndex = 2
//        return true
        displayLogin()
        return true
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    
    private func displayLogin() {
        setRootViewController(loginViewController)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingViewController)
        }
    }
    
    private func prepMainView() {
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor

    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.7,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
//        if LocalState.hasOnboarded {
//            setRootViewController(mainViewController)
//        } else {
//            setRootViewController(onboardingContainerViewController)
//        }
    }
}
 
 extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        setRootViewController(mainViewController)
    }
}

extension AppDelegate: LogoutDelegate {
    @objc func didLogout() {
        setRootViewController(loginViewController)
    }
}
    


class SearchViewController: UIViewController {
    override func viewDidLoad() {
        title = "Search"
    }
}

class ContactsViewController: UIViewController {
    override func viewDidLoad() {
        title = "Contacts"
    }
}

class FavoritesViewController: UIViewController {
    override func viewDidLoad() {
        title = "Favorites"
    }
}
