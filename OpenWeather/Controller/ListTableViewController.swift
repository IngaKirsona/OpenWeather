//
//  ListTableViewController.swift
//  OpenWeather
//
//  Created by Inga Kirsona on 20/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var githubList = [
        "https://github.com/IngaKirsona/DarkModeApp",
        "https://github.com/IngaKirsona/TraficLights",
        "https://github.com/IngaKirsona/UIElementsLayoutHomework",
        "https://github.com/IngaKirsona/WeeklyDayFinder",
        "https://github.com/IngaKirsona/ConverterTemperature",
        "https://github.com/IngaKirsona/ConverterTemperature",
        "https://github.com/IngaKirsona/LifeCycle",
        "https://github.com/IngaKirsona/MovieList",
        "https://github.com/IngaKirsona/LoginApp",
        "https://github.com/IngaKirsona/ShoppingList",
        "https://github.com/IngaKirsona/PoekmonCards",
        "https://github.com/IngaKirsona/WebRecipes",
        "https://github.com/IngaKirsona/RestCountries"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return githubList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "webCell", for: indexPath)
        cell.textLabel?.text = githubList[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
 //-------> when clicked on row, navigate to webViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: WebViewController = storyBoard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.passedValue = githubList[indexPath.row]
        self.present(vc, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
}
