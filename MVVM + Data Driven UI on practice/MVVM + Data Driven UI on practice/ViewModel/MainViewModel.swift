//
//  MainViewModel.swift
//  MVVM + Data Driven UI on practice
//
//  Created by Olexsii Levchenko on 5/27/22.
//

import Foundation


protocol MainViewModelDelegate {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFatch()
    func error()
}


final class MainViewModel: MainViewModelDelegate {
    
    
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    
    public func error() {
        updateViewData?(.failure(ViewData.Data(icon: "desktopcomputer.trianglebadge.exclamationmark",
                                               title: "Error",
                                               description: "Invalidet password",
                                               numberPhone: nil)))
    }
    
    
    public func startFatch() {
        updateViewData?(.success(ViewData.Data(icon: "lock.open.desktopcomputer",
                                               title: "Unlocked Computer",
                                               description: "Your computer unlock",
                                               numberPhone: nil)))
    }
}
