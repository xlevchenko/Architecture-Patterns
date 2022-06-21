//
//  DetailPresenter.swift
//  MVP Example
//
//  Created by Olexsii Levchenko on 6/20/22.
//

import Foundation


protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkService, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkService
    let comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkService, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    func tap() {
        router?.popToRoot()
    }
}
