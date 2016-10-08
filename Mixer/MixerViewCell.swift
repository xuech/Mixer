//
//  MixerViewCell.swift
//  Mixer
//
//  Created by xuech on 16/9/30.
//  Copyright © 2016年 obizsoft. All rights reserved.
//

import UIKit

class MixerViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!

    var mixer: Mixer! {
        didSet {
            nameLabel.text = mixer.name
            detailLabel.text = mixer.detail
            thumbnailImageView.image = UIImage(named: mixer.thumbnail)
            ratingImageView.image = imageForOverall(mixer.attendeeRating)
        }
    }
    
    func imageForOverall(_ rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
