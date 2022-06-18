//
//  UsersCell.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import UIKit

final class UsersCell: UITableViewCell {

    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .baseColors.getWhite()
    }

    func configure(config: User) {
        if let url = URL(string: config.picture.medium), let data = try? Data(contentsOf: url) {
            userImageView.image = UIImage(data: data)
        }
        
        nameLabel.text = config.getName()
        infoLabel.text = config.getInfo()
    }
}
