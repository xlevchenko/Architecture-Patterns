//
//  Router.swift
//  MVP Example
//
//  Created by Olexsii Levchenko on 6/21/22.
//

import UIKit


protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol! { get set }
}


protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDitail(comment: Comment?)
    func popToRoot()
}


class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    
    var assemblyBuilder: AssemblyBuilderProtocol!
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainController =  assemblyBuilder?.creatMainModule(router: self) else { return }
            navigationController.viewControllers = [mainController]
        }
    }
    
    func showDitail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailController =  assemblyBuilder?.creatDetailModule(comment: comment, router: self) else { return }
            navigationController.pushViewController(detailController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
    
}
