//
//  StockViewController.swift
//  StockControlApp
//
//  Created by Guilherme on 02/12/2017.
//  Copyright © 2017 Guilherme. All rights reserved.
//

import UIKit
import DataKit

class StockViewController: UITableViewController, UISearchBarDelegate  {

    let maxSession = 5
    let maxRow = 15
    
    @IBOutlet weak var searchBar: UISearchBar!
    lazy var dataStock = [Int:[Stock]]()

    lazy var originalDataStock = [Int: [Stock]]()
    
    var cache = [String: UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataStock = generateStocks(maxSession: maxSession, maxRow: maxRow)
        originalDataStock = dataStock
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataStock.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataStock[section]?.count)!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        
        let content = dataStock[indexPath.section]![indexPath.row]
        
        cell.textLabel?.text = String(format: "\(content.name) : %.2f(%.2f)", content.currentValue, content.variation)
        cell.detailTextLabel?.text = content.description
        
        var image = UIImage(named: content.imageName)
        image = image?.withRenderingMode(.alwaysTemplate)
        cell.imageView?.image = image
        
        var red:Float = 0
        var green:Float = 0
        var blue:Float = 0

        if content.variation < 0 {
            red = 0.8
        } else if content.variation > 0 {
            green = 0.8
        } else {
            blue = 0.8
        }
        
        cell.imageView?.tintColor = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        
        return cell
    }
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataStock = originalDataStock
            tableView.reloadData()
            return
        }
        
        for (section, list) in originalDataStock {
            let filtered = list.filter {
                let textToSearch = "\($0.name) \($0.description)"
                return textToSearch.range(of: searchText.uppercased()) != nil
            }
            dataStock[section] = filtered
        }
        tableView.reloadData()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
