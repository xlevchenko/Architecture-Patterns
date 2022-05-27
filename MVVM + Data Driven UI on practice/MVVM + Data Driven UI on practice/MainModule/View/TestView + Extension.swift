//
//  TestView + Extension.swift
//  MVVM + Data Driven UI on practice
//
//  Created by Olexsii Levchenko on 5/27/22.
//

import UIKit

extension TestView {
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        return imageView
    }
    
    
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = .green
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            activityIndicatorView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5),
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        return activityIndicatorView
    }
    
    
    func makeTitleLabel() -> UILabel {
        let titelLabel = makeLabel(size: 20)
        titelLabel.font = .boldSystemFont(ofSize: 20)
        titelLabel.numberOfLines = 0
        addSubview(titelLabel)
        
        NSLayoutConstraint.activate([
        titelLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
        titelLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        return titelLabel
    }
    
    
    func makeDiscriptionLabel() -> UILabel {
        let descriptionLabel = makeLabel(size: 14)
        descriptionLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
        descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titelLabel.bottomAnchor, multiplier: 1),
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        return descriptionLabel
    }
    
    
    func makeLabel(size: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = . black
        label.font = .systemFont(ofSize: size)
        addSubview(label)
        return label
    }
}



