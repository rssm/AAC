//
//  SearchViewController.swift
//  ApoieACena
//
//  Created by Felipe Montenegro on 3/31/17.
//  Copyright © 2017 Felipe Montenegro. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,
UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friendsArray = [FriendItem]()
    var filteredFriends = [FriendItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filteredFriends += [FriendItem(name: "Acre (AC)")]
        self.filteredFriends += [FriendItem(name: "Alagoas (AL)")]
        self.filteredFriends += [FriendItem(name: "Amapá (AP)")]
        self.filteredFriends += [FriendItem(name: "Amazonas (AM)")]
        self.filteredFriends += [FriendItem(name: "Bahia (BA)")]
        self.filteredFriends += [FriendItem(name: "Ceará (CE)")]
        self.filteredFriends += [FriendItem(name: "Distrito Federal (DF)")]
        self.filteredFriends += [FriendItem(name: "Espírito Santo (ES)")]
        self.filteredFriends += [FriendItem(name: "Goiás (GO)")]
        self.filteredFriends += [FriendItem(name: "Maranhão (MA)")]
        self.filteredFriends += [FriendItem(name: "Mato Grosso (MT)")]
        self.filteredFriends += [FriendItem(name: "Mato Grosso do Sul (MS)")]
        self.filteredFriends += [FriendItem(name: "Minas Gerais (MG)")]
        self.filteredFriends += [FriendItem(name: "Pará (PA)")]
        self.filteredFriends += [FriendItem(name: "Paraíba (PB)")]
        self.filteredFriends += [FriendItem(name: "Paraná (PR)")]
        self.filteredFriends += [FriendItem(name: "Pernambuco (PE)")]
        self.filteredFriends += [FriendItem(name: "Piauí (PI)")]
        self.filteredFriends += [FriendItem(name: "Rio de Janeiro (RJ)")]
        self.filteredFriends += [FriendItem(name: "Rio Grande do Norte (RN)")]
        self.filteredFriends += [FriendItem(name: "Rio Grande do Sul (RS)")]
        self.filteredFriends += [FriendItem(name: "Rondônia (RO)")]
        self.filteredFriends += [FriendItem(name: "Roraima (RR)")]
        self.filteredFriends += [FriendItem(name: "Santa Catarina (SC)")]
        self.filteredFriends += [FriendItem(name: "São Paulo (SP)")]
        self.filteredFriends += [FriendItem(name: "Sergipe (SE)")]
        self.filteredFriends += [FriendItem(name: "Tocantins (TO)")]
        
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.searchDisplayController?.searchResultsTableView) {
            return self.filteredFriends.count
        }
        else {
            return self.friendsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        var friend : FriendItem
        if(tableView == self.searchDisplayController?.searchResultsTableView) {
            friend = self.filteredFriends[indexPath.row]
        }
        else {
            friend = self.friendsArray[indexPath.row]
        }
        
        cell.textLabel?.text = friend.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var friend : FriendItem
        
        if(tableView == self.searchDisplayController?.searchResultsTableView) {
            friend = self.filteredFriends[indexPath.row]
        }
        else {
            friend = self.friendsArray[indexPath.row]
        }
        
        print(friend.name)
        
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "Title") {
        self.filteredFriends = self.friendsArray.filter({(friend : FriendItem) -> Bool in
            var categoryMatch = (scope == "Title")
            var stringMatch = friend.name.range(of: searchText)
            
            return categoryMatch && (stringMatch != nil)
        })
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearch searchString: String?) -> Bool {
        self.filterContentForSearchText(searchText: searchString!, scope: "Title")
        
        return true
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(searchText: (self.searchDisplayController!.searchBar.text)!, scope: "Title")
        return true
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
