//
//  UserListingContoller.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import UIKit

class UserListingContoller: UIViewController {

    @IBOutlet weak var usersTableView: UsersTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GetUsersCommand().execute()
    }
}

