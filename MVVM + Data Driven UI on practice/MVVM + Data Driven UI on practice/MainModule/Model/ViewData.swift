//
//  ViewData.swift
//  MVVM + Data Driven UI on practice
//
//  Created by Olexsii Levchenko on 5/27/22.
//

import Foundation


enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
