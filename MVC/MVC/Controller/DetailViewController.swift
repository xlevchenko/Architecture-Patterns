//
//  DetailViewController.swift
//  MVC
//
//  Created by Olexsii Levchenko on 6/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            guard let image = menu?.imageView else { return }
            imageView.image = UIImage(named: image)
        }
    }
    
    @IBOutlet weak var label: UILabel! {
        didSet {
            label.text = menu?.name
        }
    }
    
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
