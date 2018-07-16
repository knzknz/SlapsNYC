//
//  FindAParkViewController.swift
//  SlapsNYC
//
//  Created by C4Q on 6/4/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit


class FindAParkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var park: Parks!
    
    var allParks = [Parks]()
    var queensParks = [Parks]()
    var brooklynParks = [Parks]()
    var manhattanParks = [Parks]()
    var statenIslandParks = [Parks]()
    var bronxParks = [Parks]()
    //To help load the right park in detail VC
    var selectedBorough = [Parks]()
    var currentIndex: Int!

    @IBOutlet weak var customSegmentedControl: CustomSegmentedControl!
    @IBOutlet weak var boroughLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var boroughImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.separatorColor = UIColor(white: 0.95, alpha: 1)

        loadParkData()
        loadParksByBorough()
        
        //to test the data is there
//        for park in allParks {
//            print(park.Name)
//        }
        myTableView.backgroundColor = UIColor.black
        customSegmentedControl.backgroundColor = UIColor.white
    
    
    self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    func loadParksByBorough() {
        
        for park in allParks {
            if park.Prop_ID?.first == "Q" {
                queensParks.append(park)
            } else if park.Prop_ID?.first == "B" {
                brooklynParks.append(park)
            } else if park.Prop_ID?.first == "M" {
                manhattanParks.append(park)
            } else if park.Prop_ID?.first == "R" {
                statenIslandParks.append(park)
            } else {
                bronxParks.append(park)
            }
        }
        
    }

    
    func loadParkData() {
        if let path = Bundle.main.path(forResource: "HandballCourts", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let decodedParkData = try myDecoder.decode([Parks].self, from: data)
                    self.allParks = decodedParkData
                }
                catch let error {
                    print(error)
                }
            }
        }
    }
    
    
    //MARK: -TableView Setup
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        switch customSegmentedControl.selectedSegmentIndex {
        case 0:
            returnValue = queensParks.count
        case 1:
            returnValue = brooklynParks.count
        case 2:
            returnValue = manhattanParks.count
        case 3:
            returnValue = statenIslandParks.count
        case 4:
            returnValue = bronxParks.count
        default:
            break
        }
        
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ParkTableViewCell
        
        switch customSegmentedControl.selectedSegmentIndex {
        case 0:
            park = queensParks[indexPath.row]
            selectedBorough = queensParks
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts
            
        case 1:
            park = brooklynParks[indexPath.row]
            selectedBorough = brooklynParks
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts

        case 2:
            park = manhattanParks[indexPath.row]
            selectedBorough = manhattanParks
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts

        case 3:
            park = statenIslandParks[indexPath.row]
            selectedBorough = statenIslandParks
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts

        case 4:
            park = bronxParks[indexPath.row]
            selectedBorough = bronxParks
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts

        default:
            break
        }
        
//        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
                cell.contentView.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
        //Before performing segue get the current index of the cell
        self.currentIndex = indexPath.row
        performSegue(withIdentifier:"parkDetailSegue", sender: self)
    }
    
    
    //MARK: - Configure Custom Segmented Control
    @IBAction func customSegmentedValueChanged(_ sender: CustomSegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = .black
//            boroughLabel.text = "Queens"
            boroughImageView.image = UIImage(named: "queens")
            
        case 1:
            self.view.backgroundColor = UIColor.blue
//            boroughLabel.text = "Brooklyn"
            boroughImageView.image = UIImage(named: "brooklyn")
        case 2:
            self.view.backgroundColor = UIColor.cyan
//            boroughLabel.text = "Manhattan"
            boroughImageView.image = UIImage(named: "manhattan")

        case 3:
            self.view.backgroundColor = UIColor.darkGray
//            boroughLabel.text = "Staten Island"
            boroughImageView.image = UIImage(named: "statenIsland")

        case 4:
            self.view.backgroundColor = UIColor.black
//            boroughLabel.text = "Bronx"
            boroughImageView.image = UIImage(named: "bronx")

        default:
            view.backgroundColor = .white
        }
        
        myTableView.reloadData()
}
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "parkDetailSegue" {
            let destination = segue.destination as! ParkDetailViewController
            //Have a park variable in ParkDetailViewController
            //destination.park = self.allParks[currentIndex]
            destination.park = self.selectedBorough[currentIndex]
        }
    }
    
}
    

