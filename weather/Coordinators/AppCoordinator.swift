//
//  AppCoordinator.swift
//  weather
//
//  Created by Muhammed Shabeer on 14/10/21.
//

import UIKit

enum AppTransition {
    case mainScreen
}

class AppCoordinator {
    private let window: UIWindow
    private var rootViewController: UINavigationController
    
    // MARK: initialization
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
    }
    
    // MARK: Coordinator methods
    func start() {
        window.rootViewController = rootViewController
        performTransition(transition: .mainScreen)
        window.makeKeyAndVisible()
    }
    
    func performTransition(transition: AppTransition) {
        switch transition {
        case .mainScreen:
           let viewModel = MainScreenViewModel()
           let viewController = MainScreenViewController(viewModel: viewModel)
            rootViewController.pushViewController(viewController, animated: true)
        }
    }
}
