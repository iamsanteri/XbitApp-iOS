//
//  ViewController.swift
//  XbitApp
//
//  Created by Santeri Liukkonen on 14.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var expert: Expert?
    
    @IBOutlet var coverImage: UIImageView!
    
    @IBOutlet var phoneImage: UIImageView!
    
    @IBOutlet var mailImage: UIImageView!
    
    @IBOutlet var scheduleImage: UIImageView!
    
    @IBOutlet var profileImage: UIImageView!

    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
                
        if let expert = expert {
            print(expert.name)
        }
        
        // Do any additional setup after loading the view.
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        
        setupSystemImage(image: phoneImage)
        setupSystemImage(image: mailImage)
        setupSystemImage(image: scheduleImage)
        
    }
    
    func setupSystemImage(image: UIImageView) {

        let circleBorder = 1
        
        image.clipsToBounds = false
        image.layer.masksToBounds = false
        image.layer.cornerRadius  = image.frame.size.height / 2
        image.layer.borderWidth = CGFloat(circleBorder)
        image.layer.borderColor = UIColor.systemOrange.cgColor
    }
}

