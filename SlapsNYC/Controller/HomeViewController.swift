//
//  ViewController.swift
//  SlapsNYC
//
//  Created by C4Q on 6/4/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    //github test
    
    @IBOutlet var homePageButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    func configureButtons() {
        homePageButtons[0].setTitle("Find A Park", for: .normal)
        homePageButtons[1].setTitle("Tournaments", for: .normal)
        homePageButtons[2].setTitle("Find A Live Match", for: .normal)
        homePageButtons[3].setTitle("Community Chat", for: .normal)
        
        homePageButtons.forEach { (button) in
            button.backgroundColor = UIColor.blue.withAlphaComponent(0.75)
            button.layer.cornerRadius = 5
            button.layer.shadowColor = UIColor.lightGray.cgColor
            button.layer.shadowOpacity = 0.75
            button.layer.shadowOffset = CGSize(width: 10, height: 10)
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        }
        
    }
    
    


}

