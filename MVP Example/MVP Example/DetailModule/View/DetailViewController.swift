//
//  DetailViewController.swift
//  MVP Example
//
//  Created by Olexsii Levchenko on 6/20/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    
    var presentor: DetailViewPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentor.setComment()
    }
    
    @IBAction func tapAction(_ sender: Any) {
        presentor.tap()
    }
}


extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
    
    
}
