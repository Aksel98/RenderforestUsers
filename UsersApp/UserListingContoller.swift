//
//  UserListingContoller.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import UIKit

final class UserListingContoller: BaseViewController {

    @IBOutlet private weak var usersTableView: UsersTableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tabBar: UISegmentedControl!
    
    private var indicatorView: IndicatorView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setIndicatorView()
        setDelegation()
        loadUsers()
        setColors()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationBar(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
    }
    
    private func setIndicatorView() {
        indicatorView = IndicatorView(containerView: view)
        indicatorView?.start()
    }
    
    private func loadUsers() {
        UserApiDataProvider.shared.loadUsers(complition: { [weak self] in
            self?.usersTableView.setUsers(selectedTab: .users)
            self?.indicatorView?.stop()
        })
    }
    
    private func setDelegation() {
        searchBar.delegate = usersTableView
    }
    
    private func setColors() {
        view.backgroundColor = .baseColors.getLightGray()
        usersTableView.backgroundColor = .baseColors.getWhite()
        searchBar.searchTextField.backgroundColor = .baseColors.getGray()
        searchBar.searchTextField.leftView?.tintColor = .baseColors.getDarkGray()
        searchBar.searchTextField.textColor = .baseColors.getDarkGray()
        tabBar.backgroundColor = .baseColors.getGray()
        tabBar.selectedSegmentTintColor = .baseColors.getWhite()
        tabBar.setTitleTextAttributes([.foregroundColor : UIColor.baseColors.getBlack()], for: .normal)
    }
    
    @IBAction func changeTabAction(_ sender: UISegmentedControl) {
        let selectedTab = TabEnum(rawValue: sender.selectedSegmentIndex) ?? .users
        usersTableView.setUsers(selectedTab: selectedTab)
    }
}
