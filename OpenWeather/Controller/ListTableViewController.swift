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
    
}
