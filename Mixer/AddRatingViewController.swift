//
//  AddRatingViewController.swift
//  Mixer
//
//  Created by xuech on 16/9/30.
//  Copyright © 2016年 obizsoft. All rights reserved.
//

import UIKit
import React

class AddRatingViewController: UIViewController {
    var addRatingView: RCTRootView!
    var mixer: Mixer!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRatingView = RCTRootView(
            bundleURL: URL(string: "http://localhost:8081/index.ios.bundle?platform=ios"),
            moduleName: "AddRatingApp",
            initialProperties: nil,
            launchOptions: nil)
        self.view.addSubview(addRatingView)
        
    }
    var currentRating: Int {
        get {
            return UserDefaults.standard.integer(forKey: "currentRating-\(mixer.identifier)")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "currentRating-\(mixer.identifier)")
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addRatingView.frame = self.view.bounds
    }


}
