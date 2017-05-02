//
//  SearchTableViewController.swift
//  ApoieACena
//
//  Created by Felipe Montenegro on 4/5/17.
//  Copyright © 2017 Felipe Montenegro. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    let tableData = ["Acre (AC)","Alagoas (AL)","Amapá (AP)","Amazonas (AM)","Bahia (BA)","Ceará (CE)","Distrito Federal (DF)","Espírito Santo (ES)","Goiás (GO)","Maranhão (MA)","Mato Grosso (MT)","Mato Grosso do Sul (MS)","Minas Gerais (MG)","Pará (PA)","Paraíba (PB)","Paraná (PR)","Pernambuco (PE)","Piauí (PI)","Rio de Janeiro (RJ)","Rio Grande do Norte (RN)","Rio Grande do Sul (RS)","Rondônia (RO)","Roraima (RR)","Santa Catarina (SC)","São Paulo (SP)","Sergipe (SSE)","Tocantins (TO)"]
    var filteredArray = [String]()
    var shouldShowSearchResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        
        //teste de pull
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = tableData.filter({ (names: String) -> Bool in
            return names.lowercased().range(of: searchText.lowercased()) != nil
        })
        
        if(searchText != "") {
            shouldShowSearchResults = true
            self.tableView.reloadData()
        }
        else {
            shouldShowSearchResults = false
            self.tableView.reloadData()
        }
    }
    
    func createSearchBar() {
        
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Pesquisa por Estado"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (shouldShowSearchResults) {
            return filteredArray.count
        }
        else {
            return tableData.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        if(shouldShowSearchResults) {
            cell.textLabel?.text = filteredArray[indexPath.row]
            return cell
        }
        else {
            cell.textLabel?.text = tableData[indexPath.row]
            return cell
        }
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        searchBar.endEditing(true)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(shouldShowSearchResults) {
            if filteredArray[indexPath.row] == "Minas Gerais (MG)"{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let destination = storyboard.instantiateViewController(withIdentifier: "MinasViewController") as! MinasViewController
                navigationController?.pushViewController(destination, animated: true)
            }
            if filteredArray[indexPath.row] == "São Paulo (SP)"{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let destination = storyboard.instantiateViewController(withIdentifier: "SaoPauloViewController") as! SaoPauloViewController
                navigationController?.pushViewController(destination, animated: true)
                
            }
            if filteredArray[indexPath.row] == "Acre (AC)"{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let destination = storyboard.instantiateViewController(withIdentifier: "AcreViewController") as! AcreViewController
                navigationController?.pushViewController(destination, animated: true)
                
            }
            
        }
        else {
            if tableData[indexPath.row] == "Minas Gerais (MG)"{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let destination = storyboard.instantiateViewController(withIdentifier: "MinasViewController") as! MinasViewController
                navigationController?.pushViewController(destination, animated: true)
            }
            if tableData[indexPath.row] == "São Paulo (SP)"{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let destination = storyboard.instantiateViewController(withIdentifier: "SaoPauloViewController") as! SaoPauloViewController
                navigationController?.pushViewController(destination, animated: true)
                
            }
            if tableData[indexPath.row] == "Acre (AC)"{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let destination = storyboard.instantiateViewController(withIdentifier: "AcreViewController") as! AcreViewController
                navigationController?.pushViewController(destination, animated: true)
                
            }
            
        }
        
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
