//
//  RegionsTableViewController.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 13.04.23.
//

import UIKit

class RegionsTableViewController: UITableViewController {

   private static let reuseIdentifier = "RegionsCell"
    
    
   var categories = ["Summer Cities","Ski Centers"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
      
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return categories.count
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
                //cell.textLabel?.text = categories[indexPath.row]

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
  

    }
    
    func addCategory(_ categoryName: String) {
        var updatedCategories = categories
        updatedCategories.append(categoryName)
        categories = updatedCategories
            
         
            tableView.reloadData()
        }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        if editingStyle == .delete {
            if indexPath.row >= 2 {
                if let indexToRemove = categories.firstIndex(of: selectedCategory) {
                    categories.remove(at: indexToRemove)
                    UserDefaults.standard.set(categories, forKey: "SavedCategories")
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            } else {
               print("delete failed")
               
            }
        }
        
    }
}
