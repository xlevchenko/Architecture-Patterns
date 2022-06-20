//
//  DetailPresenter.swift
//  MVP Example
//
//  Created by Olexsii Levchenko on 6/20/22.
//

import Foundation


protocol DetailViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkService, comment: Comment?)
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let networkService: NetworkService
    let comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkService, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
