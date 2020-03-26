//
//  ViewController.swift
//  XbitApp
//
//  Created by Santeri Liukkonen on 14.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
//    var expert: Expert? = Expert(name: "David Symhoven", phoneNumber: "1234", email: "david.symhoven@jambit.de", photo: #imageLiteral(resourceName: "david_high_resolution"), skills: [Skill(skill: "Swift", level: 5), Skill(skill: "iOS", level: 2), Skill(skill: "Scrum", level: 3)], role: "Architect")
    
    var expert: Expert?
    
    @IBOutlet var coverImage: UIImageView!
    
    @IBOutlet var phoneImage: UIImageView!
    
    @IBOutlet var mailImage: UIImageView!
    
    @IBOutlet var scheduleImage: UIImageView!
    
    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var roleLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var skill1Label: UILabel!
    
    @IBOutlet weak var skill2Label: UILabel!
    
    @IBOutlet weak var skill3Label: UILabel!
    
    @IBOutlet weak var skill1RatingView: RatingView!
    
    @IBOutlet weak var skill2RatingView: RatingView!
    
    @IBOutlet weak var skill3RatingView: RatingView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        
        setupSystemImage(image: phoneImage)
        setupSystemImage(image: mailImage)
        setupSystemImage(image: scheduleImage)
        
        if let expert = expert {
            print("Test")
            profileImage.image = expert.photo
            nameLabel.text = expert.name
            roleLabel.text = expert.role
            phoneLabel.text = expert.phoneNumber
                        
            switch expert.skills!.count {
            case 0:
                skill1Label.isHidden = true
                skill2Label.isHidden = true
                skill3Label.isHidden = true
                skill1RatingView.isHidden = true
                skill2RatingView.isHidden = true
                skill3RatingView.isHidden = true
            case 1:
                skill1Label.isHidden = false
                skill2Label.isHidden = true
                skill3Label.isHidden = true
                skill1RatingView.isHidden = false
                skill2RatingView.isHidden = true
                skill3RatingView.isHidden = true
                skill1Label.text = expert.skills![0].skillName
                skill1RatingView.rating = expert.skills![0].level!
            case 2:
                skill1Label.isHidden = false
                skill2Label.isHidden = false
                skill3Label.isHidden = true
                skill1RatingView.isHidden = false
                skill2RatingView.isHidden = false
                skill3RatingView.isHidden = true
                skill1Label.text = expert.skills![0].skillName
                skill1RatingView.rating = expert.skills![0].level!
                skill2Label.text = expert.skills![1].skillName
                skill2RatingView.rating = expert.skills![1].level!
            case 3:
                skill1Label.isHidden = false
                skill2Label.isHidden = false
                skill3Label.isHidden = false
                skill1RatingView.isHidden = false
                skill2RatingView.isHidden = false
                skill3RatingView.isHidden = false
                skill1Label.text = expert.skills![0].skillName
                skill1RatingView.rating = expert.skills![0].level!
                skill2Label.text = expert.skills![1].skillName
                skill2RatingView.rating = expert.skills![1].level!
                skill3Label.text = expert.skills![2].skillName
                skill3RatingView.rating = expert.skills![2].level!
            default:
                skill1Label.isHidden = false
                skill2Label.isHidden = false
                skill3Label.isHidden = false
                skill1RatingView.isHidden = false
                skill2RatingView.isHidden = false
                skill3RatingView.isHidden = false
                skill1Label.text = expert.skills![0].skillName
                skill1RatingView.rating = expert.skills![0].level!
                skill1Label.text = expert.skills![1].skillName
                skill1RatingView.rating = expert.skills![1].level!
                skill1Label.text = expert.skills![2].skillName
                skill1RatingView.rating = expert.skills![2].level!
            }
        }
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

