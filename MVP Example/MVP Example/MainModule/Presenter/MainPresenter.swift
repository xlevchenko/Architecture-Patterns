//
//  MainPresenter.swift
//  MVP + UnitTest
//
//  Created by Olexsii Levchenko on 6/19/22.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenter: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}


class MainPresenter: MainViewPresenter {
    
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
}

