//
//  MenuCell.swift
//  MVC
//
//  Created by Olexsii Levchenko on 6/11/22.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
     
    var menu: Menu? {
        didSet {
            label.text = menu?.name
            if let image = menu?.imageView {
                imageView.image = UIImage(named: image)
            }
        }
    }
}
