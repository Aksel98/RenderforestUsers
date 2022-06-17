//
//  UserListingContoller.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import UIKit

final class UserListingContoller: UIViewController {

    @IBOutlet weak var usersTableView: UsersTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersTableView.setUsers(selectedTab: TabEnum.users)
    }
    
    @IBAction func changeTabAction(_ sender: UISegmentedControl) {
        usersTableView.setUsers(selectedTab: TabEnum(rawValue: sender.selectedSegmentIndex) ?? .users)
    }
}

