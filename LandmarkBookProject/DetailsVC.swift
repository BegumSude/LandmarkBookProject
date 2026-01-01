//
//  DetailsVC.swift
//  LandmarkBookProject
//
//  Created by Begüm Sude Bölükbaş on 1.01.2026.
//

import UIKit

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var LandmarkNameLabel: UILabel!
    @IBOutlet weak var LandmarkImageLabel: UIImageView!
    
    var selectedLandMarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LandmarkNameLabel.text = selectedLandMarkName
        LandmarkImageLabel.image = selectedLandmarkImage
    }

}
