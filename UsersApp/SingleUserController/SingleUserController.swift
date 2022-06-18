//
//  SingleUserController.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit
import MapKit

final class SingleUserController: BaseViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var imageVIew: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var removeButton: UIButton!
    @IBOutlet private weak var saveUserButton: UIButton!
    
    private var user: User!
    var backAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMapView()
        configureSaveButtons()
        configure()
        hideNavigationBar(false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        backAction?()
    }
    
    func setUser(_ user: User) {
        self.user = user
    }
    
    private func configure() {
        if let url = URL(string: user.picture.large), let data = try? Data(contentsOf: url) {
            imageVIew.image = UIImage(data: data)
        }
        
        nameLabel.text = user.getName()
        infoLabel.text = user.getInfo()
        title = "\(user.getName())"
    }
    
    private func configureMapView() {
        let latitude = Double(user.location.coordinates.latitude) ?? 0
        let longitude = Double(user.location.coordinates.longitude) ?? 0
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region, animated: true)
    }
    
    private func configureSaveButtons() {
        UserLocalDataProvider.shared.getSavedUsers().contains(where: { $0.email == user.email }) ? setRemoveState() : setSaveState()
    }
    
    private func setSaveState() {
        setState(title: "Save user", backgroundColor: .baseColors.getGreen(), state: .saved)
    }
    
    private func setRemoveState() {
        setState(title: "User saved", backgroundColor: .baseColors.getGray(), state: .removed)
    }
    
    private func setState(title: String, backgroundColor: UIColor, state: UserLocalState) {
        saveUserButton.setTitle(title, for: .normal)
        saveUserButton.backgroundColor = backgroundColor
        removeButton.isHidden = state == .saved
        saveUserButton.isEnabled = state == .saved
    }
    
    @IBAction func saveUserAction(_ sender: Any) {
        UserLocalDataProvider.shared.saveUser(user)
        setRemoveState()
    }
    
    @IBAction func removeUserAction(_ sender: Any) {
        UserLocalDataProvider.shared.removeUser(user)
        setSaveState()
    }
}
