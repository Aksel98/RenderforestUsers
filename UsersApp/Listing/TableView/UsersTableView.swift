//
//  UsersTableView.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import UIKit

final class UsersTableView: UITableView, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var users: [User] = []
    private var lastContentOffset: CGFloat = 0
    private var lastSeeingRow: Int = 0
    private var searchedText: String?
    private var currentTab: TabEnum = .users
    private var workItem: DispatchWorkItem?
    private weak var searchBar: UISearchBar?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    private func configure() {
        let nib = UINib(nibName: getCellName(), bundle: nil)
        register(nib, forCellReuseIdentifier: getCellName())
        delegate = self
        dataSource = self
    }
    
    func getCellName() -> String {
        return "UsersCell"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserSelectionCommand(user: users[indexPath.row], backAction: { [weak self] in
            guard let self = self else { return }
            
            self.setUsers(selectedTab: self.currentTab)
        }).execute()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: getCellName(), for: indexPath) as! UsersCell
        cell.configure(config: users[indexPath.row])
        
        return cell
    }
    
    func setUsers(selectedTab: TabEnum) {
        searchedText = nil
        searchBar?.text = nil
        users = selectedTab == .users ? UserApiDataProvider.shared.getUsers() : UserLocalDataProvider.shared.getSavedUsers()
        currentTab = selectedTab
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard searchedText == nil, indexPath.row == users.count - 1, indexPath.row > lastSeeingRow, currentTab == .users else { return }
        
        UserApiDataProvider.shared.changePage()
        UserApiDataProvider.shared.loadUsers(complition: { [weak self] in
            self?.setUsers(selectedTab: .users)
        })
        
        lastSeeingRow = indexPath.row
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedText = searchText.isEmpty ? nil : searchText
        self.searchBar = searchBar

        workItem?.cancel()
        let newWorkItem = DispatchWorkItem(block: { [self] in
            defer { reloadData() }
            guard searchText != "" else {
                users = currentTab == .users ? UserApiDataProvider.shared.getUsers() : UserLocalDataProvider.shared.getSavedUsers()
                return
            }
            
            users = currentTab == .users ? UserApiDataProvider.shared.getSearchUsers(searchText) : UserLocalDataProvider.shared.getSearchUsers(searchText)
        })
        
        workItem = newWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: newWorkItem)
    }
}
