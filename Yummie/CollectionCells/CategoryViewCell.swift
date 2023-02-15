//
//  CategoryViewCell.swift
//  Yummie
//
//  Created by Maheen on 14/02/2023.
//

import UIKit
import Kingfisher

class CategoryViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImageView.kf.setImage(with: category.image.asUrl)
    }
}
