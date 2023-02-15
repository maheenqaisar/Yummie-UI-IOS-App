//
//  OnboardingCell.swift
//  Yummie
//
//  Created by Maheen on 14/02/2023.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCell.self)
    
    @IBOutlet weak var SlideImage: UIImageView!
    @IBOutlet weak var SlideDescr: UILabel!
    @IBOutlet weak var SlideTitle: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        SlideImage.image = slide.image
        SlideTitle.text = slide.title
        SlideDescr.text = slide.description
    }
}
