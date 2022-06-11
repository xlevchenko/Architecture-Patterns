//
//  ViewController.swift
//  MVC
//
//  Created by Olexsii Levchenko on 6/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemMenuArray: [Menu] = {
        var blank = Menu()
        blank.name = "Coca-cola"
        blank.imageView = "cola"
        
        
        var blank2 = Menu()
        blank2.name = "Coffee"
        blank2.imageView = "coffee"
        
        return [blank, blank2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu
                print(menu ?? "nil")
                vc.menu =  menu
            }
        }
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath)  as? MenuCell {
            cell.menu = itemMenuArray[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = itemMenuArray[indexPath.row]
        self.performSegue(withIdentifier: "showVC", sender: menu)
    }
}
