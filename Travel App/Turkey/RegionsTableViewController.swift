//
//  RegionsTableViewController.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 13.04.23.
//

import UIKit

class RegionsTableViewController: UITableViewController {

   private static let reuseIdentifier = "RegionsCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: UIImage(named: "Gruppe 3"))
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addButton))
        
      
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegionsTableViewController.reuseIdentifier, for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Summer Cities"
        case 1:
            cell.textLabel?.text = "Ski Centers"
        default:
            break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "warmRegions", sender: nil)
        case 1:
            performSegue(withIdentifier: "coldRegions", sender: nil)
        default:
            return
        }
    }
    
    @objc func addButton() {
        performSegue(withIdentifier: "AddNewPlace", sender: nil)
    }


}
