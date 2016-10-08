//
//  MixerDetailsViewController.swift
//  Mixer
//
//  Created by xuech on 16/9/30.
//  Copyright © 2016年 obizsoft. All rights reserved.
//

import UIKit

class MixerDetailsViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingImg: UIImageView!
    @IBOutlet weak var myRateLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var rattingBtn: UIButton!

    var mixer: Mixer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        titleLabel.text = mixer.name
        infoLabel.text = mixer.detail
        locationLabel.text = mixer.location
        ratingImg.image = imageForOverall(mixer.attendeeRating)
        thumbnailImg.image = UIImage(named: mixer.thumbnail)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let currentRating = UserDefaults.standard.integer(forKey: "currentRating-\(mixer.identifier)")
        myRateLabel.text = currentRating > 0 ? String(repeating: "★", count: currentRating) : "None"
        let addButtonTitle = currentRating > 0 ? "Change My Rating": "Add Rating"
        rattingBtn.setTitle(addButtonTitle, for: UIControlState())
        segmentedControl.selectedSegmentIndex = currentRating > 0 ? 2 : 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoLabel.sizeToFit()
    }
    
    func imageForOverall(_ rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }

    @IBAction func segmentControlTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 2 {
            let addRatingViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddRatingViewController") as! AddRatingViewController
            addRatingViewController.mixer = mixer
            self.present(addRatingViewController, animated: true, completion: nil)
        }
    }

}
