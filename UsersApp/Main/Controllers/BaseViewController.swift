//
//  BaseViewController.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit

class BaseViewController: UIViewController {
    
    func hideNavigationBar(_ isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: false)
    }
}
