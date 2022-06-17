//
//  SingleUserController.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit
import MapKit

class SingleUserController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var saveUserButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.setNavigationBarHidden(false, animated: false)
        title = "\(user.name.first) \(user.name.last)"
        
        configureMapView()
        configureSaveButtons()
        
        if let url = URL(string: user.picture.large), let data = try? Data(contentsOf: url) {
            imageVIew.image = UIImage(data: data)
        }
        
        nameLabel.text = user.getName()
        infoLabel.text = user.getInfo()
    }
    
    private func configureMapView() {
//        let center = CLLocationCoordinate2D(latitude: user.location.coordinates.latitude, longitude: user.location.coordinates.longitude)
//        mapView.setCenter(center, animated: false)
    }
    
    private func configureSaveButtons() {
//        UserLocalDataProvider().getSavedUsers().contains(where: { $0.email == user.email }) ? removeState() : saveState()
    }
    
    private func saveState() {
//        saveUserButton.setTitle("Save user", for: .normal)
//        saveUserButton.backgroundColor = UIColor(named: "UsersGreenColor")
//        saveUserButton.isEnabled = true
//        removeButton.isHidden = true
    }
    
    private func removeState() {
//        saveUserButton.setTitle("User saved", for: .normal)
//        saveUserButton.backgroundColor = UIColor(named: "UsersGreyColor")
//        saveUserButton.isEnabled = false
//        removeButton.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func saveUserAction(_ sender: Any) {
//        UserLocalDataProvider().saveUser(user)
//        removeState()
    }
    
    @IBAction func removeUserAction(_ sender: Any) {
//        UserLocalDataProvider().removeUser(user)
//        saveState()
    }
}
