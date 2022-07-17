//
//  ViewController.swift
//  SegmentApp
//
//  Created by Дмитрий Процак on 17.07.2022.
//

import UIKit

class ViewController: UIViewController {

    
   @IBOutlet weak var heroImageView: UIImageView!
    var segmentControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let heroes = ["woman","cs1","cs2"]
        segmentControl = UISegmentedControl(items: heroes)
        
        //чтобы изображение не растягивалось
        heroImageView.contentMode = .scaleAspectFill
        
        //задаем цвет и шрифт текста для нормал
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 18)!, NSAttributedString.Key.foregroundColor : UIColor.lightGray], for: .normal)
        
        //задаем цвет и шрифт текста для селектед
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 30)!, NSAttributedString.Key.foregroundColor : UIColor.purple], for: .selected)
        
        
        
        segmentControl.selectedSegmentIndex = 0
        
        
        segmentControl.addTarget(self, action: #selector(segmentAction(sender:)), for: .valueChanged)
        
        view.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 16),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentControl.heightAnchor.constraint(equalToConstant: 48)])
        
    }
   
    ///функция для измениния вью при выборе персонажа
    @objc func segmentAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: changeHero(for: 1)
        case 1: changeHero(for: 2)
        case 2: changeHero(for: 3)
        default: break
        }
    }
    
    func changeHero(for index: Int) {
        UIView.animate(withDuration: 0.5, animations: {
            self.heroImageView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.heroImageView.alpha = 1
                self.heroImageView.image = UIImage(named: "\(index)")!
            }
        }

    }


}

