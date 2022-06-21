//
//  AssemblyModuleBuilder.swift
//  MVP + UnitTest
//
//  Created by Olexsii Levchenko on 6/19/22.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func creatMainModule(router: RouterProtocol) -> UIViewController
    func creatDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}


class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func creatMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networlService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func creatDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presentor = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presentor = presentor
        return view
    }
}
