//
//  UsersCell.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import UIKit

class UsersCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(config: User) {
        if let url = URL(string: config.picture.medium), let data = try? Data(contentsOf: url) {
            userImageView.image = UIImage(data: data)
        }
        
        nameLabel.text = config.getName()
        infoLabel.text = config.getInfo()
    }
    
}
