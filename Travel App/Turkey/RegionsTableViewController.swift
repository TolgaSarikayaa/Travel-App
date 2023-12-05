//
//  RegionsTableViewController.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 13.04.23.
//

import UIKit

class RegionsTableViewController: UITableViewController {

   private static let reuseIdentifier = "RegionsCell"
    
    
    private var categories: [String] {
           get {
               return UserDefaults.standard.stringArray(forKey: "SavedCategories") ?? []
           }
           set {
               UserDefaults.standard.set(newValue, forKey: "SavedCategories")
           }
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "SavedCategories") == nil {
               let defaultCategories = ["Summer Cities", "Ski Centers"]
               UserDefaults.standard.set(defaultCategories, forKey: "SavedCategories")
            tableView.reloadData()
           }

        tableView.backgroundView = UIImageView(image: UIImage(named: "Gruppe 3"))
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addButton))
        
      
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegionsTableViewController.reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row]
        
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
        let alertController = UIAlertController(title: "Add Category", message: "Select a category to add", preferredStyle: .alert)
        
        let summerCitiesAction = UIAlertAction(title: "Summer Cities 2", style: .default) { (_) in
            self.addCategory("Summer Cities 2")
        }
        alertController.addAction(summerCitiesAction)
        
        let skiCentersAction = UIAlertAction(title: "Ski Centers", style: .default) { (_) in
            self.addCategory("Ski Centers")
        }
        alertController.addAction(skiCentersAction)
        
    
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
       
        present(alertController, animated: true, completion: nil)

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
