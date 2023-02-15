//
//  PopularViewCell.swift
//  Yummie
//
//  Created by Maheen on 14/02/2023.
//

import UIKit
import Kingfisher

class PopularViewCell: UICollectionViewCell {

    static let identifier = String(describing: PopularViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
}
