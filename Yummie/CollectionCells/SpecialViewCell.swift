//
//  SpecialViewCell.swift
//  Yummie
//
//  Created by Maheen on 14/02/2023.
//

import UIKit
import Kingfisher

class SpecialViewCell: UICollectionViewCell {

   static let identifier = "SpecialViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
}
