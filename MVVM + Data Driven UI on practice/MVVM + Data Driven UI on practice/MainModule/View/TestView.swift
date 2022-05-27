//
//  TestView.swift
//  MVVM + Data Driven UI on practice
//
//  Created by Olexsii Levchenko on 5/27/22.
//

import UIKit

class TestView: UIView {
    
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }

    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titelLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDiscriptionLabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            break
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .success(let success):
            update(viewData: success, isHidden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        imageView.image = UIImage(systemName: viewData?.icon ?? "")
        titelLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        titelLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
    }
}
