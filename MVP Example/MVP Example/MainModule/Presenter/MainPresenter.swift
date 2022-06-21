//
//  MainPresenter.swift
//  MVP + UnitTest
//
//  Created by Olexsii Levchenko on 6/19/22.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networlService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}


class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, networlService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networlService
        self.router = router
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    func tapOnTheComment(comment: Comment?) {
        router?.showDitail(comment: comment)
    }
}

