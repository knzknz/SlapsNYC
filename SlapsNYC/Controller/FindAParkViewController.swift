//
//  FindAParkViewController.swift
//  SlapsNYC
//
//  Created by C4Q on 6/4/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class FindAParkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var parks = [Parks]()
    var queensParks = [Parks]()
    var brooklynParks = [Parks]()
    var manhattanParks = [Parks]()
    var statenIslandParks = [Parks]()
    var bronxParks = [Parks]()
    
    var parkNameToPass = ""
    var parkAddressToPass = ""
    var numberOfCourtsToPass = ""
    var parkLatToPass = ""
    var parkLonToPass = ""

    @IBOutlet weak var customSegmentedControl: CustomSegmentedControl!
    @IBOutlet weak var boroughLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
        loadParkData()
        loadParksByBorough()
        
        //to test the data is there
//        for park in parks {
//            print(park.Name)
//        }
    }
    
    func loadParksByBorough() {
        
        for park in parks {
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
                    self.parks = decodedParkData
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
            let park = queensParks[indexPath.row]
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts
            numberOfCourtsToPass = park.Num_of_Courts!
            parkAddressToPass = park.Location!
            parkNameToPass = park.Name!
            
        case 1:
            let park = brooklynParks[indexPath.row]
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts
            numberOfCourtsToPass = park.Num_of_Courts!
            parkAddressToPass = park.Location!
            parkNameToPass = park.Name!

        case 2:
            let park = manhattanParks[indexPath.row]
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts
            numberOfCourtsToPass = park.Num_of_Courts!
            parkAddressToPass = park.Location!
            parkNameToPass = park.Name!

        case 3:
            let park = statenIslandParks[indexPath.row]
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts
            numberOfCourtsToPass = park.Num_of_Courts!
            parkAddressToPass = park.Location!
            parkNameToPass = park.Name!

        case 4:
            let park = bronxParks[indexPath.row]
            cell.parkNameLabel.text = park.Name
            cell.parkAddressLabel.text = park.Location
            cell.numberOfCourtsLabel.text = park.Num_of_Courts
            numberOfCourtsToPass = park.Num_of_Courts!
            parkAddressToPass = park.Location!
            parkNameToPass = park.Name!

        default:
            break
        }
        
        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier:"parkDetailSegue", sender: self)
    }
    
    //MARK: - Configure Custom Segmented Control
    @IBAction func customSegmentedValueChanged(_ sender: CustomSegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = .black
            boroughLabel.text = "Queens"
        case 1:
            self.view.backgroundColor = UIColor.blue
            boroughLabel.text = "Brooklyn"
        case 2:
            self.view.backgroundColor = UIColor.cyan
            boroughLabel.text = "Manhattan"
        case 3:
            self.view.backgroundColor = UIColor.darkGray
            boroughLabel.text = "Staten Island"
        case 4:
            self.view.backgroundColor = UIColor.black
            boroughLabel.text = "Bronx"
        default:
            view.backgroundColor = .white
        }
        
        myTableView.reloadData()
}
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "parkDetailSegue" {
            let destination = segue.destination as! ParkDetailViewController
            destination.numOfCourts = numberOfCourtsToPass
            destination.parkAddress = parkAddressToPass
            destination.parkName = parkNameToPass
        }
    }
    
}
    

