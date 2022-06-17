//
//  UsersTableView.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import UIKit

final class UsersTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var users: [User] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    func configure() {
        let nib = UINib(nibName: "UsersCell", bundle: nil)
        register(nib, forCellReuseIdentifier: "UsersCell")
        delegate = self
        dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users)
        return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserSelectionCommand(user: users[indexPath.row]).execute()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell", for: indexPath) as! UsersCell
        cell.configure(config: users[indexPath.row])
        
        return cell
    }
    
    func setUsers(selectedTab: TabEnum) {
        self.users = selectedTab == .users ? UserApiDataProvider.shared.getUsers() : UserApiDataProvider.shared.getUsers()
        reloadData()
    }
}
