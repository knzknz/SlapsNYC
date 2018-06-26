//
//  ParkDetailViewController.swift
//  SlapsNYC
//
//  Created by C4Q on 6/13/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ParkDetailViewController: UIViewController {
    
    var park: Parks!
    var selectedSegmentIndex = 0
    
    var parkName: String!
    var numOfCourts: String!
    var parkAddress: String!
    var parkLat: String!
    var parkLon: String!
    
    //Top View Outlets
    @IBOutlet weak var numberOfCourtsLabel: UILabel!
    @IBOutlet weak var parkAddressLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    //Custom Segmented Control Outlet
    @IBOutlet weak var customSegmentedControl: CustomSegmentedControl!
    
    //Bottom View Outlets
    @IBOutlet weak var tournamentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }
    
    func configureLabels() {
        numberOfCourtsLabel.text = numOfCourts
        parkAddressLabel.text = parkAddress
    }
    
    
    @IBAction func customSegmentedValueChanged(_ sender: CustomSegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = .black
            
        case 1:
            self.view.backgroundColor = UIColor.blue
        default:
            view.backgroundColor = .white
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
