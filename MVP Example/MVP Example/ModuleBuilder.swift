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
}


class ModuleBuilder: Builder {
    static func creatMainModule() -> UIViewController {
        let model = Person(firstName: "Oleksii", lastName: "Levchenko")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
