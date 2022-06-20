//
//  ModuleBuilder.swift
//  MVP + UnitTest
//
//  Created by Olexsii Levchenko on 6/19/22.
//

import Foundation
import UIKit

protocol Builder {
    static func creatMainModule() -> UIViewController
    static func creatDetailModule(comment: Comment?) -> UIViewController
}


class ModuleBuilder: Builder {
    
    static func creatMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networlService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func creatDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presentor = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presentor = presentor
        return view
    }
}
