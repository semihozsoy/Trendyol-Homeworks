//
//  UserSearchBarViewController.swift
//  SearchBarController
//
//  Created by Semih Özsoy on 4.05.2021.
//

import UIKit

class UserSearchBarViewController: UIViewController {

    @IBOutlet weak var userSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltiring: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        

    let userUrlString = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string: userUrlString) else {return}
    
    let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
        self.users = users!
    }

}

extension UserSearchBarViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltiring {
            return filteredUsers.count
        }
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
        cell?.textLabel?.text = users[indexPath.row].name
        cell?.detailTextLabel?.text = users[indexPath.row].company.name
        return cell!
    }
    
    
}


extension UserSearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUsers = users.filter({ (user:User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
        })
        
        isFiltiring = true
        tableView.reloadData()
    }
}
