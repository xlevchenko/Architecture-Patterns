//
//  MainViewController.swift
//  MVP + UnitTest
//
//  Created by Olexsii Levchenko on 6/19/22.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapButton(_ sender: Any) {
        self.presenter.showGreeting()
    }
}


extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
